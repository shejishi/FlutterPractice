import 'package:flutter/material.dart';

class WidgetWrap extends StatefulWidget {
  const WidgetWrap({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WidgetWrapState();
  }
}

class WidgetWrapState extends State<WidgetWrap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("测试使用Padding"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              children: [
                Text("Wrap第一个View"),
                Chip(
                  label: Text("label1"),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Text("A"),
                  ),
                ),
                Chip(
                  label: Text("label1"),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Text("A"),
                  ),
                ),
                Chip(
                  label: Text("label1"),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Text("A"),
                  ),
                ),
                Chip(
                  label: Text("label1"),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Text("A"),
                  ),
                ),
                Chip(
                  label: Text("label1"),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Text("A"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
