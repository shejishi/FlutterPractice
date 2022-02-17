import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatefulWidgetUI extends StatefulWidget {
  const StatefulWidgetUI({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StatefulWidget2();
  }
}

class StatefulWidget2 extends State<StatefulWidgetUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("按钮使用"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("中间文字"),
            IconButton(
              onPressed: () {
                print("点击了~~");
              },
              icon: const Icon(Icons.print),
              color: Colors.blue,
            ),
            ElevatedButton(
              onPressed: () {
                print("点击了 ElevatedButton ~~");
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const <Widget>[
                  Icon(Icons.email),
                  Text("ElevatedButton"),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                print("点击了 TextButton ~");
              },
              child: const Text("使用TextButton"),
            ),
          ],
        ),
      ),
    );
  }
}

class StatefulWidgetState extends State<StatefulWidgetUI> {
  final List<Tab> myTabs = [
    const Tab(text: "测试1"),
    const Tab(text: "测试2"),
    const Tab(text: "测试3"),
    const Tab(text: "测试4"),
    const Tab(text: "测试5"),
    const Tab(text: "测试6"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: TabBar(
            tabs: myTabs,
            isScrollable: true,
            labelColor: Colors.white12,
            padding: const EdgeInsets.all(0),
          ),
        ),
        // body: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: const <Widget>[Text("Hello world"), CloseButton()],
        //   ),
        // ),
        body: TabBarView(
          children: myTabs
              .map((Tab tab) => Center(
                    child: Text(tab.text.toString()),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
