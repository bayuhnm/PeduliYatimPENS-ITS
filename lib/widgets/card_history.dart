import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'asset/icon/InfaqYatim.png',
            height: 40,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            width: MediaQuery.of(context).size.width * 3 / 4 - 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 3 / 4,
                  child: Text(
                    "PYPI-05062023-6105022210188",
                    textAlign: TextAlign.left,
                    style: greyTextStyle.copyWith(
                        fontSize: 10, fontWeight: regular),
                  ),
                ),
                SizedBox(height: 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Text(
                        'Donasi Temporary',
                        style: darkTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
                      ),
                    ),
                    Text(
                      'Rp. 20.000',
                      textAlign: TextAlign.right,
                      style: greenTextStyle.copyWith(
                          fontSize: 14, fontWeight: semiBold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1 / 2,
                  child: Text(
                    "Bantu Pembelian Fasilitas Belajar Yayasan At-Thoha",
                    textAlign: TextAlign.left,
                    style: greyTextStyle.copyWith(
                        fontSize: 12, fontWeight: regular),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 3 / 4 - 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "6 June 2023 - 16.11",
                        style: darkTextStyle.copyWith(
                            fontSize: 12, fontWeight: medium),
                      ),
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 7,
                            right: 7,
                          ),
                          child: Center(
                            child: Text(
                              'SUKSES',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                color: Colors.green,
                                fontSize: 12,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
