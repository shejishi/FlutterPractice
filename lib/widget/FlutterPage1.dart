import 'package:flutter/material.dart';

class FlutterPage1 extends StatefulWidget {
  const FlutterPage1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FlutterPage1State();
  }
}

class FlutterPage1State extends State<FlutterPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FlatButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, "/page2");
            },
            label: Text("page 1"),
            icon: Icon(Icons.follow_the_signs),
          ),
        ),
      ),
    );
  }
}
