import 'package:flutter/material.dart';

class IntroductionTopBackView extends StatefulWidget {
  final AnimationController animationController;
  final VoidCallback onBackClick;
  final VoidCallback onSkinClick;

  const IntroductionTopBackView(
      {Key? key,
      required this.animationController,
      required this.onBackClick,
      required this.onSkinClick})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return IntroductionTopBackState();
  }
}

class IntroductionTopBackState extends State<IntroductionTopBackView> {
  @override
  Widget build(BuildContext context) {
    final animation =
        Tween(begin: const Offset(0, -1), end: const Offset(0, 0)).animate(
      CurvedAnimation(
          parent: widget.animationController,
          curve: const Interval(
            0.0,
            0.2,
            curve: Curves.fastOutSlowIn,
          )),
    );

    final skinAnimation =
        Tween(begin: const Offset(0, 0), end: const Offset(2, 0)).animate(
            CurvedAnimation(
                parent: widget.animationController,
                curve: const Interval(0.6, 0.8, curve: Curves.fastOutSlowIn)));

    return SlideTransition(
      position: animation,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: SizedBox(
          height: 58,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: widget.onBackClick,
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
                SlideTransition(
                  position: skinAnimation,
                  child: IconButton(
                    onPressed: widget.onSkinClick,
                    icon: const Text("Skip"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
