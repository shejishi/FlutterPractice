import 'package:flutter/material.dart';
import 'package:flutter_demo/introducation_animation/IntroductionRelaxView.dart';
import 'package:flutter_demo/introducation_animation/IntroductionTopBackView.dart';

import 'IntroductionCareView.dart';
import 'IntroductionCenterNextButton.dart';
import 'IntroductionMoodView.dart';
import 'IntroductionSplashView.dart';
import 'IntroductionWelcomeView.dart';

class IntroductionAnimationScreen extends StatefulWidget {
  const IntroductionAnimationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return IntroductionAnimationStateScreen();
  }
}

class IntroductionAnimationStateScreen
    extends State<IntroductionAnimationScreen> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 8));
    animationController.animateTo(0.0);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7EbE1),
      body: ClipRect(
        child: Stack(
          children: [
            IntroductionSplashView(animationController: animationController),
            IntroductionRelaxView(animationController: animationController),
            IntroductionCareView(animationController: animationController),
            IntroductionMoodView(animationController: animationController),
            IntroductionWelcomeView(animationController: animationController),
            IntroductionTopBackView(
                animationController: animationController,
                onBackClick: onBackClick,
                onSkinClick: onSkinClick),
            IntroductionCenterNextButton(
                animationController: animationController,
                nextCallback: onNextClick),
          ],
        ),
      ),
    );
  }

  void onSkinClick() {
    animationController.animateTo(0.8,
        duration: const Duration(milliseconds: 1200), curve: Curves.ease);
  }

  void onBackClick() {
    if (animationController.value >= 0 && animationController.value <= 0.2) {
      animationController.animateTo(0.0);
    } else if (animationController.value > 0.2 &&
        animationController.value <= 0.4) {
      animationController.animateTo(0.2);
    } else if (animationController.value > 0.4 &&
        animationController.value <= 0.6) {
      animationController.animateTo(0.4);
    } else if (animationController.value > 0.6 &&
        animationController.value <= 0.8) {
      animationController.animateTo(0.6);
    } else if (animationController.value > 0.8 &&
        animationController.value <= 1.0) {
      animationController.animateTo(0.8);
    }
  }

  void onNextClick() {
    if (animationController.value >= 0 && animationController.value <= 0.2) {
      animationController.animateTo(0.4);
    } else if (animationController.value > 0.2 &&
        animationController.value <= 0.4) {
      animationController.animateTo(0.6);
    } else if (animationController.value > 0.4 &&
        animationController.value <= 0.6) {
      animationController.animateTo(0.8);
    } else if (animationController.value > 0.6 &&
        animationController.value <= 0.8) {
      Navigator.pop(context);
    }
  }
}
