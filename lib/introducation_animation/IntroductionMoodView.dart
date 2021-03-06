import 'package:flutter/material.dart';

class IntroductionMoodView extends StatefulWidget {
  const IntroductionMoodView({Key? key, required this.animationController})
      : super(key: key);

  final AnimationController animationController;

  @override
  State<StatefulWidget> createState() {
    return IntroductionMoodState();
  }
}

class IntroductionMoodState extends State<IntroductionMoodView> {
  @override
  Widget build(BuildContext context) {
    final firstAnimation =
        Tween(begin: const Offset(1, 0), end: const Offset(0, 0)).animate(
      CurvedAnimation(
          parent: widget.animationController,
          curve: const Interval(0.4, 0.6, curve: Curves.fastOutSlowIn)),
    );

    final imageSlideInAnimation =
        Tween(begin: const Offset(4, 0), end: const Offset(0, 0)).animate(
      CurvedAnimation(
          parent: widget.animationController,
          curve: const Interval(0.4, 0.6, curve: Curves.fastOutSlowIn)),
    );

    final titleSlideInAnimation =
        Tween(begin: const Offset(2, 0), end: const Offset(0, 0)).animate(
      CurvedAnimation(
          parent: widget.animationController,
          curve: const Interval(0.4, 0.6, curve: Curves.fastOutSlowIn)),
    );

    final secondAnimation =
        Tween(begin: const Offset(0, 0), end: const Offset(-1, 0)).animate(
      CurvedAnimation(
          parent: widget.animationController,
          curve: const Interval(0.6, 0.8, curve: Curves.fastOutSlowIn)),
    );

    final imageSlideOutAnimation =
        Tween(begin: const Offset(0, 0), end: const Offset(-4, 0)).animate(
      CurvedAnimation(
          parent: widget.animationController,
          curve: const Interval(0.6, 0.8, curve: Curves.fastOutSlowIn)),
    );

    final titleSlideOutAnimation =
        Tween(begin: const Offset(0, 0), end: const Offset(-2, 0)).animate(
      CurvedAnimation(
          parent: widget.animationController,
          curve: const Interval(0.6, 0.8, curve: Curves.fastOutSlowIn)),
    );

    return SlideTransition(
      position: firstAnimation,
      child: SlideTransition(
        position: secondAnimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "????????????",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SlideTransition(
              position: titleSlideInAnimation,
              child: SlideTransition(
                position: titleSlideOutAnimation,
                child: const Padding(
                  padding:
                      EdgeInsets.only(left: 64, right: 64, bottom: 16, top: 16),
                  child: Text(
                    "????????????????????????????????????????????????????????????,????????????????????????????????????????????????????????????",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SlideTransition(
              position: imageSlideInAnimation,
              child: SlideTransition(
                position: imageSlideOutAnimation,
                child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 350, maxHeight: 250),
                  child: Image.asset(
                    "assets/introduction_animation/mood_dairy_image.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
