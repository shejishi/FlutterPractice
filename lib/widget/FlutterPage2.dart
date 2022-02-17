import 'package:flutter/material.dart';

class FlutterPage2 extends StatefulWidget {
  const FlutterPage2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FlutterPage2State();
  }
}

class FlutterPage2State extends State<FlutterPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("这是第二个页面"),
      ),
      body: SafeArea(
        child: Center(
          child: Text("page 2"),
        ),
      ),
    );
  }
}
