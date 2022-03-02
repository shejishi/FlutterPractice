import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/design/DesignCourseAppTheme.dart';
import 'package:flutter_demo/utils/HexColor.dart';

import 'CategoryListView.dart';
import 'PopularCourseListView.dart';

class DesignCourseHome extends StatefulWidget {
  const DesignCourseHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DesignCourseHomeState();
  }
}

class DesignCourseHomeState extends State<DesignCourseHome> {
  CategoryType categoryType = CategoryType.UI;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DesignCourseAppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            getAppBarUI(),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      getSearchBarUI(),
                      getCategoryUI(),
                      Flexible(
                        child: getPopularCourseUI(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getAppBarUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Choose your",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 12, color: DesignCourseAppTheme.grey),
                ),
                Text(
                  "Design Course",
                  textAlign: TextAlign.start,
                  style: DesignCourseAppTheme.title,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: Image.asset("assets/design_course/userImage.png"),
          ),
        ],
      ),
    );
  }

  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
              color: HexColor("#F8FAFB"),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: TextFormField(
                      style: const TextStyle(
                        fontFamily: "WorkSans",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: DesignCourseAppTheme.nearlyBlue,
                      ),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Search for course",
                        border: InputBorder.none,
                        helperStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: HexColor("#B9BABC"),
                        ),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: 0.2,
                          color: HexColor("#B9BABC"),
                        ),
                      ),
                      onEditingComplete: () {},
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Icon(
                    Icons.search,
                    color: HexColor("#B9BABC"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Widget getCategoryUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Text(
            "Category",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: DesignCourseAppTheme.darkerText,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: [
              getButtonUI(CategoryType.UI, categoryType == CategoryType.UI),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(CategoryType.Coding, categoryType == CategoryType.Coding),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(CategoryType.Basic, categoryType == CategoryType.Basic),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CategoryListView(
          callback: () {
            moveTo();
          },
        ),
      ],
    );
  }

  Widget getButtonUI(CategoryType type, bool isSelected) {
    String txt = "";
    if (CategoryType.UI == type) {
      txt = "Ui/Ux";
    } else if (CategoryType.Coding == type) {
      txt = "Coding";
    } else if (CategoryType.Basic == type) {
      txt = "Basic UI";
    }

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? DesignCourseAppTheme.nearlyBlue : DesignCourseAppTheme.nearlyWhite,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: DesignCourseAppTheme.nearlyBlue),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            onTap: () {
              setState(() {
                categoryType = type;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: isSelected ? DesignCourseAppTheme.nearlyWhite : DesignCourseAppTheme.nearlyBlue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void moveTo() {}

  Widget getPopularCourseUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular Course1",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.darkerText,
            ),
          ),
          Flexible(
            child: PopularCourseListView(callBack: () {}),
          ),
        ],
      ),
    );
  }
}

enum CategoryType {
  UI,
  Coding,
  Basic,
}
