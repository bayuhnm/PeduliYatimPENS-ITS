import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/pages/donation_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/topup_amount_page.dart';
import '../widgets/percentage_bar.dart';

class DetailDonationPage extends StatelessWidget {
  const DetailDonationPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      theme: ThemeData(
        primaryColor: myColor,
        primarySwatch: myColor,
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: backgroundDarkGreenColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: Text(
              'Detail Donasi',
              style: whiteTextStyle.copyWith(fontSize: 18),
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
                        builder: (context) => TopupAmountPage(),
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
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(
                          'asset/image/imageA3.jpg',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            'Beasiswa prestasi untuk anak-anak penghafal Al-Quran',
                            style: darkTextStyle.copyWith(
                              height: 1.2,
                              fontSize: 18,
                              fontWeight: medium,
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: screenWidth - 70,
                                child: PercentageBar(
                                  percentage: 30,
                                  width: screenWidth - 70,
                                ),
                              ),
                              Text(
                                '30%',
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
                                'Rp. 1.500.000',
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
                                '45.000.000',
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
                            '30 Hari Lagi',
                            style: darkTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: semiBold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Di antara banyak bulan yang ada, Allah SWT secara khusus menjadikan Ramadan sebagai bulan paling mulia. Di setiap harinya, Allah kucurkan pahala juga pengampunan untuk orang-orang beriman yang berpuasa dan melakukan kebaikan. Baik dalam urusan agama maupun berbuat baik untuk sesama. Tak tanggung tanggung, setiap kebaikan itu akan diganjar pahala berlipat ganda, hingga 10 kali bahkan 700 kali kebaikan. Maka nikmat mana yang akan kita dustakan? Maka kesempatan mana yang akan kita abaikan?',
                            style: semidarkTextStyle.copyWith(
                              height: 1.5,
                              fontSize: 14,
                              fontWeight: regular,
                            ),
                          )
                        ],
                      ),
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
