import 'package:flutter/material.dart';
import 'package:flutter_demo/AppTheme.dart';
import 'package:flutter_demo/MainTab.dart';
import 'package:flutter_demo/baisc/WidgetSingleChildScroll.dart';
import 'package:flutter_demo/baisc/WidgetWrap.dart';
import 'package:flutter_demo/widget/FlutterPage1.dart';
import 'package:flutter_demo/widget/FlutterPage2.dart';
import 'package:flutter_demo/widget/FlutterPage3.dart';
import 'package:flutter_demo/widget/WidgetListCard.dart';

import 'baisc/WidgetConstrainedBox.dart';
import 'baisc/WidgetProgress.dart';
import 'widget/StatefulWidgetUI.dart';
import 'widget/TestUI.dart';
import 'widget/WidgetColumn.dart';
import 'widget/WidgetExpand.dart';
import 'widget/WidgetListCard2.dart';
import 'widget/WidgetListCardDelete.dart';
import 'widget/WidgetListObject.dart';
import 'widget/WidgetRow.dart';
import 'widget/WidgetUserCard.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
      ),
      home: const MainTab(),
      // initialRoute: "/page1",
      // routes: {
      //   "/page1": (context) => FlutterPage1(),
      //   "/page2": (context) => FlutterPage2(),
      //   "/page3": (context) => FlutterPage3(),
      // },
    );
  }
}
