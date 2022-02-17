import 'package:flutter/material.dart';

class FlutterPage3 extends StatefulWidget {
  const FlutterPage3({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FlutterPage3State();
  }
}

class FlutterPage3State extends State<FlutterPage3> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("page 3"),
        ),
      ),
    );
  }
}
