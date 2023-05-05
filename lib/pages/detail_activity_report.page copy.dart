import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/pages/donation_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/topup_amount_page.dart';
import '../widgets/percentage_bar.dart';

class DetailActivityPage extends StatelessWidget {
  const DetailActivityPage({super.key});

  @override
  Widget build(BuildContext context) {

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
              'Detail Laporan Kegiatan',
              style: whiteTextStyle.copyWith(fontSize: 18),
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
                          'asset/image/imageB2.jpeg',
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
                            'Penyaluran Zakat',
                            style: darkTextStyle.copyWith(
                              height: 1.2,
                              fontSize: 18,
                              fontWeight: medium,
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
