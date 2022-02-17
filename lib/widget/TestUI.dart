import 'package:flutter/material.dart';

double _volume = 0.0;

class TestUI extends StatelessWidget {
  const TestUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "测试app",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("测试使用AppBar"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("Hello world"),
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.widgets_outlined),
                label: "主页",
                backgroundColor: Colors.black38),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet_rounded),
                label: "钱包",
                backgroundColor: Colors.black38),
          ],
          onTap: (tappedIndex) {
            showAboutDialog(
                context: context, applicationName: tappedIndex.toString());
          },
        ),
      ),
    );
  }
}
