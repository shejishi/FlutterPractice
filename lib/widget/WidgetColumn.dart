import 'package:flutter/material.dart';

class WidgetColumn extends StatefulWidget {
  const WidgetColumn({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WidgetColumnState();
  }
}

class WidgetColumnState extends State<WidgetColumn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("测试使用Padding"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: const Text("Row第一个View")),
          FlatButton(
            onPressed: () {
              print("FlatButton click");
            },
            child: const Text("click me"),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.blueGrey,
                child: const Icon(Icons.account_balance),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
