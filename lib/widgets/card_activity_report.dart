import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/pages/detail_activity_report.page%20copy.dart';

class ActivityReportCard extends StatelessWidget {
  final String imageUrl;
  final String reportTitle;
  
  const ActivityReportCard({
    Key? key,
    required this.imageUrl,
    required this.reportTitle,
  }) : super(key: key);

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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailActivityPage()),
          );
        },
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
                  imageUrl,
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
                    SizedBox(
                      height: 30,
                      child: Text(
                        reportTitle,
                        style: darkTextStyle.copyWith(
                            fontSize: 12, fontWeight: semiBold),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Alhamdulillah bantuan sudah disalurkan kepada yang',
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
