import 'package:flutter/material.dart';

class WidgetSingleChildScroll extends StatefulWidget {
  const WidgetSingleChildScroll({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WidgetSingleChildScrollState();
  }
}

class WidgetSingleChildScrollState extends State<WidgetSingleChildScroll> {
  String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("测试使用Padding"),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: str.split("").map((e) {
                return Text(e);
              }).toList(),
            ),
          )),
    );
  }
}
