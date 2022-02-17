import 'package:flutter/material.dart';

class WidgetUserCard extends StatefulWidget {
  const WidgetUserCard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WidgetUserCardState();
  }
}

class WidgetUserCardState extends State<WidgetUserCard> {
  int level = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: const Text("编写一个信息卡片1"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.back_hand),
            color: Colors.blue,
            onPressed: () {},
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            level += 1;
          });
        },
      ),
      body: Padding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                foregroundImage: AssetImage("assets/1.jpg"),
                radius: 50,
              ),
            ),
            Divider(
              height: 60,
              thickness: 0.5,
              color: Colors.grey[300],
            ),
            const Text(
              "Name",
              style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 5),
            const Text(
              "Name",
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              "Level",
              style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 5),
            Text(
              "$level",
              style: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  color: Colors.white),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.email,
                  color: Colors.yellow,
                ),
                Text(
                  "12345@qq.com",
                  style: TextStyle(color: Colors.grey[300]),
                )
              ],
            )
          ],
        ),
        padding: const EdgeInsets.all(30),
      ),
    );
  }
}
