import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/models/donation_program_model.dart';
import 'package:peduli_yatim_pens_mobile/pages/donation_amount_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/donation_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/topup_amount_page.dart';
import 'package:peduli_yatim_pens_mobile/widgets/text_wrapper.dart';
import '../widgets/percentage_bar.dart';

class DetailDonationPage extends StatelessWidget {
  final DonationProgramModel data;
  String urlImage = 'https://donasi.peduliyatim.or.id/img/asset/donateprogram/';
  final String? currentDonateAmount;
  final String? donateGoal;
  final String? endAt;
  final VoidCallback? onTap;

  DetailDonationPage({
    Key? key,
    required this.data,
    this.currentDonateAmount,
    this.donateGoal,
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

  String formatCurrencyGoal(String donateGoal) {
    // Hapus semua karakter yang bukan digit
    String digitsOnly = donateGoal.replaceAll(RegExp(r'[^\d]'), '');

    // Parsing sebagai integer
    int value = int.tryParse(digitsOnly) ?? 0;

    // Format nominal dengan titik sebagai digit
    String formattedGoal = value.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');

    // Tambahkan "Rp." di depan nominal
    return '$formattedGoal';
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool _showNavigationBar = false;

    final formattedAmount =
        NumberFormat('#,##0', 'id_ID').format(int.parse(currentDonateAmount!));

    final formattedGoal =
        NumberFormat('#,##0', 'id_ID').format(int.parse(donateGoal!));

    final endAt = DateTime.parse(data.endAt!);
    final now = DateTime.now();
    final remainingDays = endAt.difference(now).inDays;

    return MaterialApp(
      theme: ThemeData(
        primaryColor: myColor,
        primarySwatch: myColor,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            color: darkColor,
            icon: Icon(
              Icons.arrow_back,
              color: darkColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            'Detail Donasi',
            style: darkTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 10,
              top: 10,
            ),
            child: Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DonationAmountPage(title: data.name!,),
                    ),
                  );
                },
                child: Text(
                  'Donasi Sekarang',
                  style: whiteTextStyle.copyWith(fontWeight: medium),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // set the desired radius
                  ),
                ),
              ),
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: EdgeInsets.only(
                        left: 15, right: 15, top: 5, bottom: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: AspectRatio(
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
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        Text(
                          data.name!,
                          style: darkTextStyle.copyWith(
                            height: 1.2,
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(3),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: screenWidth - 100,
                                    child: PercentageBar(
                                      percentage: calculatePercentage(
                                          data.currentDonateAmount!,
                                          data.donateGoal!),
                                      width: screenWidth - 90,
                                    ),
                                  ),
                                  Text(
                                    '${calculatePercentage(data.currentDonateAmount!, data.donateGoal!)} %',
                                    style: greenTextStyle.copyWith(
                                        fontSize: 14, fontWeight: bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Terkumpul',
                                style: greyTextStyle.copyWith(
                                    fontSize: 12, fontWeight: medium),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Rp. $formattedAmount',
                                    style: greenTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: bold,
                                    ),
                                  ),
                                  Text(
                                    ' / ',
                                    style: greyTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: medium,
                                    ),
                                  ),
                                  Text(
                                    formattedGoal,
                                    style: greyTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: medium,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Sisa',
                                style: greyTextStyle.copyWith(
                                    fontSize: 12, fontWeight: medium),
                              ),
                              Text(
                                '$remainingDays Hari Lagi',
                                style: darkTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                TextWrapper(text: data.description!),
                              ],
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
      ),
    );
  }
}
