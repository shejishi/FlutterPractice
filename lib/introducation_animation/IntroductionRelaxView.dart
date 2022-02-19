import 'package:flutter/material.dart';

class IntroductionRelaxView extends StatefulWidget {
  final AnimationController animationController;

  const IntroductionRelaxView({Key? key, required this.animationController})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return IntroductionRelaxStateView();
  }
}

class IntroductionRelaxStateView extends State<IntroductionRelaxView> {
  @override
  Widget build(BuildContext context) {
    final firstHalfAnimation =
        Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(
      CurvedAnimation(
          parent: widget.animationController,
          curve: const Interval(
            0.0,
            0.2,
            curve: Curves.fastOutSlowIn,
          )),
    );

    final secondHalfAnimation =
        Tween(begin: const Offset(0, 0), end: const Offset(-1, 0))
            .animate(CurvedAnimation(
                parent: widget.animationController,
                curve: const Interval(
                  0.2,
                  0.4,
                  curve: Curves.fastOutSlowIn,
                )));

    final relaxAnimation =
        Tween(begin: const Offset(0, -2), end: const Offset(0, 0)).animate(
      CurvedAnimation(
          parent: widget.animationController,
          curve: const Interval(
            0.0,
            0.2,
            curve: Curves.fastOutSlowIn,
          )),
    );

    final textAnimation =
        Tween(begin: const Offset(0, 0), end: const Offset(-4, 0))
            .animate(CurvedAnimation(
                parent: widget.animationController,
                curve: const Interval(
                  0.2,
                  0.4,
                  curve: Curves.fastOutSlowIn,
                )));

    final imageAnimation =
        Tween(begin: const Offset(0, 0), end: const Offset(-8, 0))
            .animate(CurvedAnimation(
                parent: widget.animationController,
                curve: const Interval(
                  0.2,
                  0.4,
                  curve: Curves.fastOutSlowIn,
                )));

    return SlideTransition(
      position: firstHalfAnimation,
      child: SlideTransition(
        position: secondHalfAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: relaxAnimation,
                child: const Text(
                  "放松",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              SlideTransition(
                position: textAnimation,
                child: const Padding(
                  padding:
                      EdgeInsets.only(left: 64, right: 64, top: 16, bottom: 16),
                  child: Text(
                    "虽然痛苦但是很有趣味，它是主要的解决方式，虽然痛苦但是很有趣味，它是主要的解决方式，",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SlideTransition(
                position: imageAnimation,
                child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 350, maxHeight: 250),
                  child: Image.asset(
                      "assets/introduction_animation/relax_image.png",
                      fit: BoxFit.cover),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
