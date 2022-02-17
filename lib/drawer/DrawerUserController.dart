import 'package:flutter/material.dart';
import 'package:flutter_demo/AppTheme.dart';
import 'package:flutter_demo/drawer/DrawerIndex.dart';

import '../MenuView.dart';

class DrawerUserController extends StatefulWidget {
  const DrawerUserController({
    Key? key,
    this.drawerWidth = 250,
    this.screenView,
    this.menuView,
    this.screenIndex = DrawerIndex.HOME,
    this.animatedIconData,
    this.onDrawerCall,
    this.drawerIsOpen,
  }) : super(key: key);

  final double drawerWidth;
  final Widget? screenView;
  final Widget? menuView;
  final DrawerIndex screenIndex; // 当前是哪一屏
  final AnimatedIconData? animatedIconData;
  final Function(DrawerIndex)? onDrawerCall;
  final Function(bool)? drawerIsOpen;

  @override
  State<StatefulWidget> createState() {
    return DrawerUserControllerState();
  }
}

class DrawerUserControllerState extends State<DrawerUserController> {

  Future<bool> getInitState() async {

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: PageScrollPhysics(parent: ClampingScrollPhysics()),
        child: SizedBox(
          child: Row(
            children: [
              SizedBox(
                width: widget.drawerWidth,
                height: MediaQuery.of(context).size.height,
                child: MenuView(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: widget.screenView,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
