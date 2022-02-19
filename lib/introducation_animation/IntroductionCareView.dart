import 'package:flutter/material.dart';

class IntroductionCareView extends StatefulWidget {
  const IntroductionCareView({Key? key, required this.animationController})
      : super(key: key);

  final AnimationController animationController;

  @override
  State<StatefulWidget> createState() {
    return IntroductionCareState();
  }
}

class IntroductionCareState extends State<IntroductionCareView> {
  @override
  Widget build(BuildContext context) {
    final firstAnimation =
        Tween(begin: const Offset(1, 0), end: const Offset(0, 0)).animate(
      CurvedAnimation(
          parent: widget.animationController,
          curve: const Interval(0.2, 0.4, curve: Curves.fastOutSlowIn)),
    );

    final imageSlideInAnimation =
        Tween(begin: const Offset(4, 0), end: const Offset(0, 0)).animate(
      CurvedAnimation(
          parent: widget.animationController,
          curve: const Interval(0.2, 0.4, curve: Curves.fastOutSlowIn)),
    );

    final titleSlideInAnimation =
        Tween(begin: const Offset(2, 0), end: const Offset(0, 0)).animate(
      CurvedAnimation(
          parent: widget.animationController,
          curve: const Interval(0.2, 0.4, curve: Curves.fastOutSlowIn)),
    );

    final secondAnimation =
        Tween(begin: const Offset(0, 0), end: const Offset(-1, 0)).animate(
      CurvedAnimation(
          parent: widget.animationController,
          curve: const Interval(0.4, 0.6, curve: Curves.fastOutSlowIn)),
    );

    final imageSlideOutAnimation =
        Tween(begin: const Offset(0, 0), end: const Offset(-4, 0)).animate(
      CurvedAnimation(
          parent: widget.animationController,
          curve: const Interval(0.4, 0.6, curve: Curves.fastOutSlowIn)),
    );

    final titleSlideOutAnimation =
        Tween(begin: const Offset(0, 0), end: const Offset(-2, 0)).animate(
      CurvedAnimation(
          parent: widget.animationController,
          curve: const Interval(0.4, 0.6, curve: Curves.fastOutSlowIn)),
    );

    return SlideTransition(
      position: firstAnimation,
      child: SlideTransition(
        position: secondAnimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: imageSlideInAnimation,
              child: SlideTransition(
                position: imageSlideOutAnimation,
                child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 350, maxHeight: 250),
                  child: Image.asset(
                    "assets/introduction_animation/care_image.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SlideTransition(
              position: titleSlideInAnimation,
              child: SlideTransition(
                position: titleSlideOutAnimation,
                child: const Text(
                  "注意锻炼",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 64, right: 64, bottom: 16, top: 16),
              child: Text(
                "虽然痛苦但是很有趣味，它是主要的解决方式,虽然痛苦但是很有趣味，它是主要的解决方式",
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
