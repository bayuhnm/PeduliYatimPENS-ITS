import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';

class PercentageBar extends StatelessWidget {
  final int percentage;
  final double width;

  PercentageBar({required this.percentage, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 4,
      decoration: BoxDecoration(
        // color: Colors.grey[300],
        color: backgroundLightGreenColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            width: (percentage <= 100 ? percentage : 100) * width / 100,
            height: 4,
            decoration: BoxDecoration(
              color: greenPrimaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
    );
  }
}

int calculatePercentage(String currentDonateAmount, String donateGoal) {
    double currentAmount = double.tryParse(currentDonateAmount) ?? 0;
    double goal = double.tryParse(donateGoal) ?? 0;

    if (currentAmount <= 0 || goal <= 0) {
      return 0; // Mengembalikan 0 jika jumlah saat ini atau tujuan adalah 0 atau tidak valid.
    }

    double percentage = (currentAmount / goal) * 100;
    return percentage.toInt();
  }
