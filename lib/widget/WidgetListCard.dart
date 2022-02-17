import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/PersonBean.dart';

class WidgetListCardObject extends StatefulWidget {
  const WidgetListCardObject({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WidgetListCardObjectState();
  }
}

class WidgetListCardObjectState extends State<WidgetListCardObject> {
  List<PersonBean> list = [
    PersonBean(name: "name", sex: "man"),
    PersonBean(name: "name1", sex: "man"),
    PersonBean(name: "name2", sex: "man"),
    PersonBean(name: "name3", sex: "man"),
    PersonBean(name: "name4", sex: "man"),
    PersonBean(name: "name5", sex: "man"),
    PersonBean(name: "name6", sex: "man"),
    PersonBean(name: "name7", sex: "man"),
    PersonBean(name: "name7", sex: "man"),
    PersonBean(name: "name7", sex: "man"),
    PersonBean(name: "name7", sex: "man"),
    PersonBean(name: "name7", sex: "man"),
    PersonBean(name: "name7", sex: "man"),
    PersonBean(name: "name7", sex: "man"),
    PersonBean(name: "name7", sex: "man"),
    PersonBean(name: "name7", sex: "man"),
    PersonBean(name: "name7", sex: "man"),
    PersonBean(name: "name7", sex: "man"),
  ];

  Widget createListCard(PersonBean personBean) {
    return Card(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      elevation: 10,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              personBean.name,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            Text(
              personBean.sex,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[200],
              ),
            ),
          ],
        ),
      ),
    );
  }

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
            return createListCard(personBean);
          }).toList(),
        ),
      ),
    );
  }
}
