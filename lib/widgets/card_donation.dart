import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/pages/detail_donation_program.page.dart';
import 'percentage_bar.dart';

class DonationCard extends StatelessWidget {
  final String imageUrl;
  final String donationTitle;
  final double percentage;
  final String money;
  final String day;

  const DonationCard({
    Key? key,
    required this.imageUrl,
    required this.donationTitle,
    required this.percentage,
    required this.money,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailDonationPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15, bottom: 20),
        height: 210,
        width: 200,
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
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 200,
                      child: Text(
                        donationTitle,
                        style: darkTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: semiBold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    PercentageBar(percentage: percentage, width: 184),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: backgroundLightGreenColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 7,
                              right: 7,
                            ),
                            child: Center(
                              child: Text(
                                'Rp. $money,-',
                                style: greenTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '$day Hari lagi',
                          style: darkTextStyle.copyWith(
                            fontSize: 11,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    )
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
