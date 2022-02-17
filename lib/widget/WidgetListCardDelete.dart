import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/PersonBean.dart';

class WidgetListCardDeleteObject extends StatefulWidget {
  const WidgetListCardDeleteObject({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WidgetListCardDeleteObjectState();
  }
}

class WidgetListCardDeleteObjectState
    extends State<WidgetListCardDeleteObject> {
  List<PersonBean> list = [
    PersonBean(name: "name", sex: "man"),
    PersonBean(name: "name1", sex: "man"),
    PersonBean(name: "name2", sex: "man"),
    PersonBean(name: "name3", sex: "man"),
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
            return ListCard(
                personBean: personBean,
                delete: () {
                  setState(() {
                    list.remove(personBean);
                  });
                });
          }).toList(),
        ),
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  final PersonBean personBean;
  final VoidCallback delete;

  const ListCard({required this.personBean, required this.delete});

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: delete,
              child: Row(
                children: const [
                  Icon(Icons.delete),
                  Text("""
delete"""),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
