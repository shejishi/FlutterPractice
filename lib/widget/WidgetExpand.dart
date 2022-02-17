import 'package:flutter/material.dart';

class WidgetExpand extends StatefulWidget {
  const WidgetExpand({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WidgetExpandState();
  }
}

class WidgetExpandState extends State<WidgetExpand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("测试使用Expand"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Image.asset("assets/1.jpg"),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blueGrey,
              padding: const EdgeInsets.all(30),
              child: const Icon(Icons.account_balance),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blueGrey,
              padding: const EdgeInsets.all(30),
              child: const Text(
                "1",
                textAlign: TextAlign.center,
                style: TextStyle(backgroundColor: Colors.deepOrange),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
