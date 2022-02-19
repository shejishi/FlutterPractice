import 'package:flutter/material.dart';

class IntroductionSplashView extends StatefulWidget {
  final AnimationController animationController;

  const IntroductionSplashView({Key? key, required this.animationController})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return IntroductionSplashStateView();
  }
}

class IntroductionSplashStateView extends State<IntroductionSplashView> {
  @override
  Widget build(BuildContext context) {
    final _splashAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0.0, -1.0))
            .animate(CurvedAnimation(
                parent: widget.animationController,
                curve: const Interval(
                  0.0,
                  0.2,
                  curve: Curves.fastOutSlowIn,
                )));

    return SlideTransition(
      position: _splashAnimation,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/introduction_animation/introduction_image.png',
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                "放空",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 64,
                right: 64,
              ),
              child: Text(
                "虽然痛苦但是很有趣味，它是主要的解决方式",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 16),
              child: InkWell(
                onTap: () {
                  widget.animationController.animateTo(0.2);
                },
                child: Container(
                  height: 58,
                  padding: const EdgeInsets.only(
                    left: 56,
                    right: 56,
                    top: 16,
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38),
                    color: const Color(0xFF132137),
                  ),
                  child: const Text(
                    "让我们开始吧",
                    style: TextStyle(fontSize: 18, color: Colors.white),
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
