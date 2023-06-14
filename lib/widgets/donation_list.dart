import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/pages/detail_donation_program.page.dart';
import 'package:peduli_yatim_pens_mobile/widgets/percentage_bar.dart';

class DonationList extends StatelessWidget {
  const DonationList({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailDonationPage(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                child: Image.asset(
                  'asset/image/imageA1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 5 / 9,
                  child: Text(
                    'Bantu Pembelian Fasilitas Belajar Yayasan At-Thoha',
                    style: darkTextStyle.copyWith(
                        fontSize: 12, fontWeight: semiBold),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                PercentageBar(
                    percentage: 40,
                    width: MediaQuery.of(context).size.width * 5 / 9),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 5 / 9,
                  child: Row(
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
                              'Rp. 17.000.000,-',
                              style: greenTextStyle.copyWith(
                                fontSize: 11,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '20 Hari lagi',
                        style: darkTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
