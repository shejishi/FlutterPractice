import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/PersonBean.dart';

class WidgetListObject extends StatefulWidget {
  const WidgetListObject({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WidgetListObjectState();
  }
}

class WidgetListObjectState extends State<WidgetListObject> {
  List<PersonBean> list = [
    PersonBean(name: "name", sex: "man"),
    PersonBean(name: "name1", sex: "man"),
    PersonBean(name: "name2", sex: "man"),
    PersonBean(name: "name3", sex: "man"),
    PersonBean(name: "name4", sex: "man"),
    PersonBean(name: "name5", sex: "man"),
    PersonBean(name: "name6", sex: "man"),
    PersonBean(name: "name7", sex: "man"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("测试使用Padding"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: list.map((PersonBean personBean) {
            return Text('${personBean.name} - ${personBean.sex}');
          }).toList(),
        ),
      ),
    );
  }
}
