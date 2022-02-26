import 'package:flutter/material.dart';
import 'package:flutter_demo/hotel/model/HotelTheme.dart';

import 'RangeSliderView.dart';

class HotelFilterPage extends StatefulWidget {
  const HotelFilterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HotelFilterState();
  }
}

class HotelFilterState extends State<HotelFilterPage> {
  RangeValues values = const RangeValues(100, 600);

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
              ],
            ),
          )),
          Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), offset: const Offset(0, -2), blurRadius: 4)],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 16),
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
        )
      ],
    );
  }
}
