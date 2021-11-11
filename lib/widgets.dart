import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

SfRadialGauge buildRangePointerExampleGauge(
  double val, {
  Widget widget,
  // ignore: avoid_init_to_null
  Color color = null,
  // ignore: avoid_init_to_null
  Color background = null,
}) {
  return SfRadialGauge(
    enableLoadingAnimation: true,
    axes: <RadialAxis>[
      RadialAxis(
        showLabels: false,
        showTicks: false,
        startAngle: 270,
        endAngle: 270,
        minimum: 0,
        maximum: 100,
        radiusFactor: 0.8,
        axisLineStyle: const AxisLineStyle(
            thicknessUnit: GaugeSizeUnit.factor, thickness: 0.15),
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(widget: widget),
        ],
        pointers: <GaugePointer>[
          RangePointer(
            value: val,
            cornerStyle: CornerStyle.bothCurve,
            enableAnimation: true,
            animationDuration: 1000,
            animationType: AnimationType.ease,
            sizeUnit: GaugeSizeUnit.factor,
            // gradient: SweepGradient(
            //     colors: <Color>[Color(0xFF6A6EF6), Color(0xFFDB82F5)],
            //     stops: <double>[0.25, 0.75]),
            color: color ?? Color(0xFF6495ED),

            width: 0.12,
          ),
        ],
      ),
    ],
  );
}

Widget cardWidget(
    double val, Color color, String title, String subtitle, Function onTap) {
  return Container(
    width: 160.0,
    height: 200.0,
    child: GestureDetector(
      onTap: onTap,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        elevation: 4.0,
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: buildRangePointerExampleGauge(val,
                    widget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '$val%',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    color: Color(0xFFFFFFFF)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: ListTile(
                  title: Text(title),
                  subtitle: Text(subtitle),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
