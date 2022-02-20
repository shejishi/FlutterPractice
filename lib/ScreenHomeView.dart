import 'package:flutter/material.dart';
import 'package:flutter_demo/AppTheme.dart';

import 'introducation_animation/model/HomeList.dart';

class ScreenHomeView extends StatefulWidget {
  const ScreenHomeView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ScreenHomeViewState();
  }
}

class ScreenHomeViewState extends State<ScreenHomeView>
    with TickerProviderStateMixin {
  List<HomeList> homeList = HomeList.homeList;
  AnimationController? animationController;
  bool multiple = false;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return SizedBox();
          } else {
            return Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appBar(),
                  Expanded(
                    child: FutureBuilder(
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (!snapshot.hasData) {
                          return SizedBox();
                        } else {
                          return GridView(
                            padding: const EdgeInsets.only(
                                top: 0, left: 12, right: 12),
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: multiple ? 2 : 1,
                              mainAxisSpacing: 12.0,
                              crossAxisSpacing: 12.0,
                              childAspectRatio: 1.5,
                            ),
                            children: List<Widget>.generate(homeList.length,
                                (int index) {
                              final int count = homeList.length;
                              final Animation<double> animation =
                                  Tween<double>(begin: 0, end: 1).animate(
                                CurvedAnimation(
                                  parent: animationController!,
                                  curve: Interval(
                                    (1 / count) * index,
                                    1.0,
                                    curve: Curves.fastOutSlowIn,
                                  ),
                                ),
                              );
                              animationController!.forward();

                              return HomeListView(
                                animation: animation,
                                animationController: animationController,
                                listData: homeList[index],
                                callback: () {
                                  Navigator.push<dynamic>(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          homeList[index].navigateScreen!,
                                    ),
                                  );
                                },
                              );
                            }),
                          );
                        }
                      },
                      future: getData(),
                    ),
                  ),
                ],
              ),
            );
          }
        },
        future: getData(),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  Widget appBar() {
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 8,
            ),
            child: SizedBox(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          const Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  'Flutter Home UI',
                  style: TextStyle(
                    fontSize: 22,
                    color: AppTheme.darkerText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              right: 8,
            ),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.white,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                      BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    multiple ? Icons.dashboard : Icons.view_agenda,
                    color: AppTheme.dark_grey,
                  ),
                  onTap: () {
                    setState(() {
                      multiple = !multiple;
                    });
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HomeListView extends StatelessWidget {
  final HomeList? listData;
  final VoidCallback? callback;
  final AnimationController? animationController;
  final Animation<double>? animation;

  const HomeListView(
      {Key? key,
      this.listData,
      this.callback,
      this.animationController,
      this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
            opacity: animation!,
            child: Transform(
              transform: Matrix4.translationValues(
                  0.0, 50 * (1.0 - animation!.value), 0.0),
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          listData!.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.grey.withOpacity(0.2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          onTap: callback,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
