import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/hotel/model/HotelTheme.dart';

class SliderView extends StatefulWidget {
  final Function(double)? onChangedistValue;
  final double? distValue;

  const SliderView({Key? key, this.onChangedistValue, this.distValue}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SliderViewState();
  }
}

class SliderViewState extends State<SliderView> {
  double distValue = 50.0;

  @override
  void initState() {
    distValue = widget.distValue!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: const SizedBox(),
                flex: distValue.round(),
              ),
              SizedBox(
                width: 170,
                child: Text("至少${(distValue / 10).toStringAsFixed(1)}千米"),
              ),
              Expanded(
                flex: 100 - distValue.round(),
                child: const SizedBox(),
              )
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              thumbShape: CustomThumbShape(),
            ),
            child: Slider(
              onChanged: (double value) {
                setState(() {
                  distValue = value;
                });
                try {
                  widget.onChangedistValue!(distValue);
                } catch (e) {
                  print(e);
                }
              },
              min: 0,
              max: 100,
              activeColor: HotelAppTheme.buildLightTheme().primaryColor,
              inactiveColor: Colors.grey.withOpacity(0.4),
              divisions: 100,
              value: distValue,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomThumbShape extends SliderComponentShape {
  static const double thumbSize = 3.0;
  static const double disableThumbSize = 3.0;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return isEnabled ? const Size.fromRadius(thumbSize) : const Size.fromRadius(disableThumbSize);
  }

  @override
  void paint(PaintingContext context, Offset center, {required Animation<double> activationAnimation, required Animation<double> enableAnimation, required bool isDiscrete, required TextPainter labelPainter, required RenderBox parentBox, required SliderThemeData sliderTheme, required TextDirection textDirection, required double value, required double textScaleFactor, required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;
    final ColorTween colorTween = ColorTween(begin: sliderTheme.disabledThumbColor, end: sliderTheme.thumbColor);

    canvas.drawPath(
        Path()
          ..addOval(Rect.fromPoints(Offset(center.dx + 12, center.dy + 12), Offset(center.dx - 12, center.dy - 12)))
          ..fillType = PathFillType.evenOdd,
        Paint()
          ..color = Colors.black.withOpacity(0.5)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(8)));

    final Paint cPaint = Paint();
    cPaint.color = Colors.white;
    cPaint.strokeWidth = 14 / 2;
    canvas.drawCircle(Offset(center.dx, center.dy), 12, cPaint);
    cPaint.color = colorTween.evaluate(enableAnimation)!;
    canvas.drawCircle(Offset(center.dx, center.dy), 10, cPaint);
  }

  double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }
}
