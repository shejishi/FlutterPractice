import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/hotel/model/HotelTheme.dart';
import 'package:flutter_demo/hotel/model/PopularFilterListData.dart';

import 'RangeSliderView.dart';
import 'SliderView.dart';

class HotelFilterPage extends StatefulWidget {
  const HotelFilterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HotelFilterState();
  }
}

class HotelFilterState extends State<HotelFilterPage> {
  RangeValues values = const RangeValues(100, 600);
  List<PopularFilterListData> popularFilterListData = PopularFilterListData.popularFList;
  List<PopularFilterListData> accommodationListData = PopularFilterListData.accommodationList;

  double distValue = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          getAppBarUI(),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                priceBarFilter(),
                Divider(
                  height: 1,
                  color: Colors.grey[300],
                ),
                popularFilter(),
                Divider(
                  height: 1,
                  color: Colors.grey[300],
                ),
                distanceView(),
                Divider(
                  height: 1,
                  color: Colors.grey[300],
                ),
                allAccommodationUI(),
              ],
            ),
          )),
          Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), offset: const Offset(0, -2), blurRadius: 4)],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 16),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: HotelAppTheme.buildLightTheme().primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Center(
                      child: Text(
                        "确定",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getAppBarUI() {
    return Container(
      decoration: BoxDecoration(
        color: HotelAppTheme.buildLightTheme().backgroundColor,
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), offset: const Offset(0, 2), blurRadius: 4),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: 8,
          right: 8,
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.close),
                  ),
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  "筛选",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                ),
              ),
            ),
            SizedBox(
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
            )
          ],
        ),
      ),
    );
  }

  Widget priceBarFilter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            "价格（一晚）",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.grey, fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16, fontWeight: FontWeight.normal),
          ),
        ),
        RangeSliderView(
          onchangeRangeValues: (rangeValues) {},
          values: values,
        ),
      ],
    );
  }

  Widget popularFilter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            "Popular filters",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.grey,
              fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
          ),
          child: Column(
            children: getPList(),
          ),
        ),
      ],
    );
  }

  List<Widget> getPList() {
    final List<Widget> noList = <Widget>[];
    int count = 0;
    const int columnCount = 2;
    for (int i = 0; i < popularFilterListData.length / columnCount; i++) {
      final List<Widget> listUI = <Widget>[];
      for (int i = 0; i < columnCount; i++) {
        final PopularFilterListData date = popularFilterListData[count];
        listUI.add(Expanded(
          child: Row(
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                  onTap: () {
                    setState(() {
                      date.isSelected = !date.isSelected;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          date.isSelected ? Icons.check_box : Icons.check_box_outline_blank,
                          color: date.isSelected ? HotelAppTheme.buildLightTheme().primaryColor : Colors.green.withOpacity(0.6),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(date.titleTxt),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
        if (count < popularFilterListData.length - 1) {
          count + -1;
        } else {
          break;
        }
      }
      noList.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: listUI,
      ));
    }
    return noList;
  }

  Widget distanceView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 8,
          ),
          child: Text(
            "距离城市中心",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.grey,
              fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        SliderView(
          distValue: distValue,
          onChangedistValue: (double value) {
            distValue = value;
          },
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget allAccommodationUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 8,
          ),
          child: Text(
            "住所的类型",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.grey,
              fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
          ),
          child: Column(
            children: getAccommodationListUI(),
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }

  List<Widget> getAccommodationListUI() {
    final List<Widget> noList = [];
    for (int i = 0; i < accommodationListData.length; i++) {
      final PopularFilterListData date = accommodationListData[i];
      noList.add(
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: const BorderRadius.all(
              Radius.circular(4.0),
            ),
            onTap: () {
              setState(() {
                checkAppPosition(i);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      date.titleTxt,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    height: 40,
                    child: CupertinoSwitch(
                      activeColor: date.isSelected ? HotelAppTheme.buildLightTheme().primaryColor : Colors.grey.withOpacity(0.6),
                      onChanged: (bool value) {
                        setState(() {
                          checkAppPosition(i);
                        });
                      },
                      value: date.isSelected,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      if (i == 0) {
        noList.add(Divider(height: 1, color: Colors.grey[300]));
      }
    }
    return noList;
  }

  void checkAppPosition(int index) {
    if (index == 0) {
      if (accommodationListData[0].isSelected) {
        for (var d in accommodationListData) {
          d.isSelected = false;
        }
      } else {
        for (var element in accommodationListData) {
          element.isSelected = true;
        }
      }
    } else {
      accommodationListData[index].isSelected = !accommodationListData[index].isSelected;
      int count = 0;
      for (int i = 0; i < accommodationListData.length; i++) {
        if (i != 0) {
          final PopularFilterListData data = accommodationListData[i];
          if (data.isSelected) {
            count != 1;
          }
        }
      }

      if (count == accommodationListData.length - 1) {
        accommodationListData[0].isSelected = true;
      } else {
        accommodationListData[0].isSelected = false;
      }
    }
  }
}
