import 'package:flutter/material.dart';
import 'package:flutter_demo/hotel/model/HotelTheme.dart';

class RangeSliderView extends StatefulWidget {
  final Function(RangeValues)? onchangeRangeValues;
  final RangeValues values;

  const RangeSliderView({Key? key, this.onchangeRangeValues, required this.values}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RangeSliderViewState();
  }
}

class RangeSliderViewState extends State<RangeSliderView> {
  RangeValues? values;

  @override
  void initState() {
    values = widget.values;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: const SizedBox(),
                    flex: values!.start.round(),
                  ),
                  Container(
                    width: 54,
                    child: Text(
                      "\$${values!.start.round()}",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: const SizedBox(),
                    flex: 1000 - values!.start.round(),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: const SizedBox(),
                    flex: values!.end.round(),
                  ),
                  Container(
                    width: 54,
                    child: Text(
                      "\$${values!.end.round()}",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: const SizedBox(),
                    flex: 1000 - values!.end.round(),
                  ),
                ],
              ),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(rangeThumbShape: RoundRangeSliderThumbShape()),
            child: RangeSlider(
              values: values!,
              onChanged: (RangeValues value) {
                setState(() {
                  values = value;
                });
                widget.onchangeRangeValues!(values!);
              },
              min: 0.0,
              max: 1000.0,
              activeColor: HotelAppTheme.buildLightTheme().primaryColor,
              inactiveColor: Colors.grey.withOpacity(0.4),
              divisions: 1000,
            ),
          ),
        ],
      ),
    );
  }
}
