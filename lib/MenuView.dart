import 'package:flutter/material.dart';
import 'package:flutter_demo/AppTheme.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MenuViewState();
  }
}

class MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.notWhite.withOpacity(0.5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "菜单页面",
            style: AppTheme.title,
          ),
        ],
      ),
    );
  }
}
