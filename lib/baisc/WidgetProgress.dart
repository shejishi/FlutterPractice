import 'package:flutter/material.dart';

class WidgetProgress extends StatefulWidget {
  const WidgetProgress({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WidgetProgressState();
  }
}

class WidgetProgressState extends State<WidgetProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("进度条使用"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 80.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("不确定value"),
              SizedBox(
                height: 10,
              ),
              LinearProgressIndicator(
                value: null,
                backgroundColor: Colors.greenAccent,
              ),
              SizedBox(
                height: 20,
              ),
              CircularProgressIndicator(
                value: null,
                backgroundColor: Colors.deepOrange,
                valueColor: AlwaysStoppedAnimation(Colors.cyanAccent),
              ),
              Divider(
                height: 50,
                thickness: 1,
              ),
              Text("确定value"),
              SizedBox(
                height: 10,
              ),
              LinearProgressIndicator(
                value: 0.3,
                backgroundColor: Colors.greenAccent,
              ),
              SizedBox(
                height: 20,
              ),
              CircularProgressIndicator(
                value: 0.6,
                backgroundColor: Colors.deepOrange,
              ),
              Divider(
                height: 50,
                thickness: 1,
              ),
              Text("自定义Progress"),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
                width: 100,
                child: LinearProgressIndicator(
                  value: 0.3,
                  backgroundColor: Colors.greenAccent,
                ),
              ),
              SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  value: 0.6,
                  backgroundColor: Colors.deepOrange,
                ),
              ),
              Divider(
                height: 50,
                thickness: 1,
              ),
              Text("自定义Progress动画"),
              LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                    .animate(animationController),
                value: animationController.value,
              )
            ],
          ),
        ),
      ),
    );
  }
}
