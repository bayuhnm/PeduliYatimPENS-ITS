import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';

class ActivityReportCard extends StatelessWidget {
  const ActivityReportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, bottom: 20),
      height: 190,
      width: 160,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: GestureDetector(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  'asset/image/imageA3.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '10 April 2023',
                          style: greyTextStyle.copyWith(
                            fontSize: 10,
                            fontWeight: medium,
                          ),
                        ),
                        Text(
                          'Ramadhan',
                          style: greenTextStyle.copyWith(
                            fontSize: 10,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Bantuan 200 Al-Quran di bulan Ramadhan',
                      style: darkTextStyle.copyWith(
                          fontSize: 12, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Bantuan 200 Al-Quran diberikan kepada panti asuhan manyar',
                      style: greyTextStyle.copyWith(
                          fontSize: 10, fontWeight: medium),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
