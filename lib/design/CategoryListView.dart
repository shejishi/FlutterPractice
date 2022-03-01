import 'package:flutter/material.dart';
import 'package:flutter_demo/design/DesignCourseAppTheme.dart';
import 'package:flutter_demo/design/models/Category.dart';
import 'package:flutter_demo/utils/HexColor.dart';

class CategoryListView extends StatefulWidget {

  final Function()? callback;

  const CategoryListView({Key? key, this.callback}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CategoryListViewState();
  }
}

class CategoryListViewState extends State<CategoryListView> with TickerProviderStateMixin {
  late AnimationController animationController;

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Container(
        height: 134,
        width: double.infinity,
        child: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapShot) {
            if (!snapShot.hasData) {
              return const SizedBox();
            } else {
              return ListView.builder(
                padding: const EdgeInsets.only(top: 0, bottom: 0, right: 16, left: 16),
                scrollDirection: Axis.horizontal,
                itemCount: Category.categoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  final int count = Category.categoryList.length > 10 ? 10 : Category.categoryList.length;

                  final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animationController,
                    curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn),
                  ));
                  animationController.forward();
                  return CategoryView(
                    callback: widget.callback!,
                    animation: animation,
                    animationController: animationController,
                    category: Category.categoryList[index],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class CategoryView extends StatelessWidget {

  final VoidCallback callback;
  final Category category;
  final AnimationController animationController;
  final Animation<double> animation;

  const CategoryView(
      {Key? key, required this.callback, required this.category, required this.animationController, required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(builder: (BuildContext context, Widget? child) {
      return FadeTransition(
        opacity: animation,
        child: Transform(
          transform: Matrix4.translationValues(100 * (1.0 - animation.value), 0, 0),
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: callback,
            child: SizedBox(
              width: 280,
              child: Stack(
                children: [
                  Container(
                    child: Row(
                      children: [
                        const SizedBox(width: 48,),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: HexColor("#F8FAFB"),
                              borderRadius: const BorderRadius.all(Radius.circular(16),),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 48 + 24.0,),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 16),
                                          child: Text(
                                            category.title,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              letterSpacing: 0.27,
                                              color: DesignCourseAppTheme.darkerText,
                                            ),
                                          ),
                                        ),
                                        const Expanded(child: SizedBox()),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 16, bottom: 8),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${category.lessonCount} lesson",
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: 12,
                                                  letterSpacing: 0.27,
                                                  color: DesignCourseAppTheme.grey,
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "${category.rating}",
                                                      textAlign: TextAlign.left,
                                                      style: const TextStyle(
                                                        fontWeight: FontWeight.w200,
                                                        fontSize: 18,
                                                        letterSpacing: 0.27,
                                                        color: DesignCourseAppTheme.grey,
                                                      ),
                                                    ),
                                                    const Icon(
                                                      Icons.star,
                                                      color: DesignCourseAppTheme.nearlyBlue,
                                                      size: 15,
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 16, right: 16,),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "\$${category.money}",
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                  letterSpacing: 0.27,
                                                  color: DesignCourseAppTheme.nearlyBlue,
                                                ),
                                              ),
                                              Container(
                                                decoration: const BoxDecoration(
                                                  color: DesignCourseAppTheme.nearlyBlue,
                                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: DesignCourseAppTheme.nearlyWhite,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(16)),
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: Image.asset(category.imagePath),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }, animation: animationController,

    );
  }

}
