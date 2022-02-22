import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AnimationState();
  }
}

class AnimationState extends State<AnimationDemo> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 5000));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);
    final slideTransition = Tween(begin: const Offset(0, 0), end: const Offset(1, 0)).animate(curvedAnimation);

    return Scaffold(
      appBar: AppBar(
        title: const Text("测试使用动画"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SlideTransition(
              position: slideTransition,
              child: const Text(
                "我是移动的view",
                style: TextStyle(fontSize: 22, color: Colors.red),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            TextButton(onPressed: () {
              animationController.forward();
            }, child: const Text("点击开始移动"))
          ],
        ),
      ),
    );
  }
}
