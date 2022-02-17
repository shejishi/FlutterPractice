import 'package:flutter/material.dart';

class WidgetPadding extends StatefulWidget {
  const WidgetPadding({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WidgetPaddingState();
  }
}

class WidgetPaddingState extends State<WidgetPadding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("测试使用Padding")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.deepOrangeAccent,
              child: const Padding(
                // padding: EdgeInsets.all(20),
                // padding: EdgeInsets.fromLTRB(20, 30, 40, 50),
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                child: Text(
                  "data",
                  style: TextStyle(backgroundColor: Colors.cyanAccent),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
