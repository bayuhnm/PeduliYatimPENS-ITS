import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';

class PercentageBar extends StatelessWidget {
  final double percentage;
  final double width;

  PercentageBar({required this.percentage, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 5,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            width: percentage * width / 100,
            height: 5,
            decoration: BoxDecoration(
              color: darkColor,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
    );
  }
}
