import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/models/donation_program_model.dart';
import 'package:peduli_yatim_pens_mobile/pages/detail_donation_program.page.dart';
import 'percentage_bar.dart';

class DonationCard extends StatelessWidget {
  final DonationProgramModel data;
  String urlImage = 'https://donasi.peduliyatim.or.id/img/asset/donateprogram/';
  final String? currentDonateAmount;
  final String? endAt;
  final VoidCallback? onTap;

  DonationCard({
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
                child: Image.network(
                  urlImage + data.photo!,
                  fit: BoxFit.fitWidth,
                  errorBuilder: (context, exception, stackTrace) {
                    return Image.asset(
                      'asset/other/image-not-found.jpg',
                      fit: BoxFit.fitWidth,
                    );
                  },
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
                        data.name!,
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
                    PercentageBar(
                        percentage: calculatePercentage(
                            data.currentDonateAmount!, data.donateGoal!),
                        width: 184),
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
                                'Rp. $formattedAmount,-',
                                style: greenTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '$remainingDays Hari lagi',
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
