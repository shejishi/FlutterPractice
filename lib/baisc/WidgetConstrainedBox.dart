import 'dart:ui';

import 'package:flutter/material.dart';

class WidgetConstrainedBox extends StatefulWidget {
  const WidgetConstrainedBox({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WidgetConstrainedBoxState();
  }
}

class WidgetConstrainedBoxState extends State<WidgetConstrainedBox> {
  Widget redBox = const DecoratedBox(
    decoration: BoxDecoration(color: Colors.blue),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("测试使用ConstrainedBox"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: double.infinity,
                minHeight: 100,
              ),
              child: Container(height: 5, child: redBox),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
            ),
            SizedBox(
              height: 100,
              width: 200,
              child: redBox,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: [
                Text("测试1", style: TextStyle(fontSize: 10),),
                Text("测试2", style: TextStyle(fontSize: 20),),
                Text("测试2", style: TextStyle(fontSize: 30),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
