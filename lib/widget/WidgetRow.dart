import 'package:flutter/material.dart';

class WidgetRow extends StatefulWidget {
  const WidgetRow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WidgetRowState();
  }
}

class WidgetRowState extends State<WidgetRow> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Row第一个View"),
                Container(
                  color: Colors.blueGrey,
                  child: const Icon(Icons.account_balance),
                ),
                FlatButton(
                  onPressed: () {
                    print("FlatButton click");
                  },
                  child: const Text("click me"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
