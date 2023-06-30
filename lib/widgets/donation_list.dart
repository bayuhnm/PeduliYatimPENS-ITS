import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/models/donation_program_model.dart';
import 'package:peduli_yatim_pens_mobile/pages/detail_donation_program.page.dart';
import 'package:peduli_yatim_pens_mobile/widgets/percentage_bar.dart';

class DonationList extends StatelessWidget {
  final DonationProgramModel data;
  String urlImage = 'https://donasi.peduliyatim.or.id/img/asset/donateprogram/';
  final String? currentDonateAmount;
  final String? endAt;
  final VoidCallback? onTap;

  DonationList({
    Key? key,
    required this.data,
    this.currentDonateAmount,
    this.endAt,
    this.onTap,
  }) : super(key: key);

  String formatCurrency(String currentDonateAmount) {
    // Hapus semua karakter yang bukan digit
    String digitsOnly = currentDonateAmount.replaceAll(RegExp(r'[^\d]'), '');

    // Parsing sebagai integer
    int value = int.tryParse(digitsOnly) ?? 0;

    // Format nominal dengan titik sebagai digit
    String formatted = value.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');

    // Tambahkan "Rp." di depan nominal
    return '$formatted';
  }

  @override
  Widget build(BuildContext context) {
    final formattedAmount =
        NumberFormat('#,##0', 'id_ID').format(int.parse(currentDonateAmount!));

    final endAt = DateTime.parse(data.endAt!);
    final now = DateTime.now();
    final remainingDays = endAt.difference(now).inDays;
    return GestureDetector(
      onTap: onTap,
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
                child: Image.network(
                  urlImage + data.photo!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, exception, stackTrace) {
                    return Image.asset(
                      'asset/other/image-not-found.jpg',
                      fit: BoxFit.cover,
                    );
                  },
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
                    data.name!,
                    style: darkTextStyle.copyWith(
                        fontSize: 12, fontWeight: semiBold),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                PercentageBar(
                    percentage: calculatePercentage(
                        data.currentDonateAmount!, data.donateGoal!),
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
                              'Rp. $formattedAmount,-',
                              style: greenTextStyle.copyWith(
                                fontSize: 11,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '$remainingDays Hari lagi',
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
