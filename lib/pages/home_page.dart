import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/pages/login_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/register_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/splash_page.dart';
import 'package:peduli_yatim_pens_mobile/widgets/card_activity_report.dart';
import 'package:peduli_yatim_pens_mobile/widgets/card_article.dart';
import 'package:peduli_yatim_pens_mobile/widgets/card_donation.dart';
import 'package:peduli_yatim_pens_mobile/widgets/donation_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: myColor,
        primarySwatch: myColor,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundGreyColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 50,
              floating: true,
              pinned: true,
              snap: false,
              centerTitle: false,
              title: Text(
                'Peduli Yatim PENS-ITS',
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
              backgroundColor: backgroundDarkGreenColor,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                )
              ],
              bottom: AppBar(
                toolbarHeight: 50,
                elevation: 0,
                backgroundColor: backgroundDarkGreenColor,
                title: Container(
                  width: double.infinity,
                  height: 36,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari donasi',
                      hintStyle:
                          TextStyle(fontFamily: 'opensans', fontSize: 14),
                      prefixIcon: Icon(Icons.search),

                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: 95,
                    decoration: BoxDecoration(color: whiteColor),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 20, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HomeDonationCategory(
                            iconUrl: 'asset/icon/Calendar.png',
                            label: 'Keuangan',
                            onTap: () {},
                          ),
                          HomeDonationCategory(
                            iconUrl: 'asset/icon/InfaqYatim.png',
                            label: 'Infaq Yatim',
                            onTap: () {},
                          ),
                          HomeDonationCategory(
                            iconUrl: 'asset/icon/Zakat.png',
                            label: 'Zakat',
                            onTap: () {},
                          ),
                          HomeDonationCategory(
                            iconUrl: 'asset/icon/Category.png',
                            label: 'Lainnya',
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => const MoreDialog(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 275,
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    decoration: BoxDecoration(
                      color: whiteColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Donasi Terbaru',
                                style: darkTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                ),
                              ),
                              Text(
                                'Lihat Lainnya',
                                style: greenTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              DonationCard(
                                imageUrl: 'asset/image/imageA2.jpg',
                                donationTitle:
                                    'Bantu Pembangunan Masjid Jami Al-Mukminin',
                                money: '67.000.000',
                                day: '39',
                                percentage: 26,
                              ),
                              DonationCard(
                                imageUrl: 'asset/image/imageA5.jpg',
                                donationTitle:
                                    'Bantu Pembelian Fasilitas Belajar Yayasan At-Thoha',
                                money: '7.820.000',
                                day: '17',
                                percentage: 68,
                              ),
                              DonationCard(
                                imageUrl: 'asset/image/imageA1.jpg',
                                donationTitle: 'Bantuan Donasi 500 Al-Quran',
                                money: '20.300.000',
                                day: '27',
                                percentage: 37,
                              ),
                              DonationCard(
                                imageUrl: 'asset/image/imageA6.jpg',
                                donationTitle:
                                    'Bantuan Sembako Untuk Fakir Miskin Sekitar PENS',
                                money: '23.000.000',
                                day: '3',
                                percentage: 89,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 254,
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    decoration: BoxDecoration(
                      color: whiteColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Laporan Kegiatan',
                                style: darkTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                ),
                              ),
                              Text(
                                'Lihat Lainnya',
                                style: greenTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            
                            children: [
                              ActivityReportCard(
                                imageUrl: 'asset/image/imageB2.jpeg',
                                reportTitle: 'Penyaluran Zakat',
                              ),
                              ActivityReportCard(
                                imageUrl: 'asset/image/imageB1.jpeg',
                                reportTitle: 'Bantuan Modal Usaha Bu Sumiyati',
                              ),
                              ActivityReportCard(
                                imageUrl: 'asset/image/imageB3.jpeg',
                                reportTitle:
                                    'Penyaluran Dana Bantuan Yayasan Terpadu',
                              ),
                              ActivityReportCard(
                                imageUrl: 'asset/image/imageB4.jpeg',
                                reportTitle: 'Bantuan Modal Usaha Bu Lely',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Image.asset('asset/image/banner1.jpg'),
                  ),
                  Container(
                    height: 300,
                    margin: const EdgeInsets.only(bottom: 0),
                    decoration: BoxDecoration(
                      color: whiteColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Artikel Terbaru',
                                    style: darkTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'Update artikel terbaru seputar islam',
                                    style: greyTextStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: regular,
                                    ),
                                  ),
                                ],
                              ),
                              // Text(
                              //   'Lihat Lainnya',
                              //   style: greenTextStyle.copyWith(
                              //     fontSize: 12,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ArticleCard(),
                              ArticleCard(),
                              ArticleCard(),
                            ],
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
