import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
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
        bottomNavigationBar: BottomAppBar(
          color: whiteColor,
          shape: const CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          notchMargin: 6,
          elevation: 3,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: whiteColor,
            elevation: 0,
            selectedItemColor: greenPrimaryColor,
            unselectedItemColor: blackColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: greenTextStyle.copyWith(
              fontSize: 10,
              fontWeight: medium,
            ),
            unselectedLabelStyle: blackTextStyle.copyWith(
              fontSize: 10,
              fontWeight: medium,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'asset/icon/Home.png',
                  width: 20,
                  color: greenPrimaryColor,
                ),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'asset/icon/Donation.png',
                  width: 20,
                  color: greyColor,
                ),
                label: 'Donasi',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'asset/icon/MoneyReport.png',
                  width: 20,
                  color: greyColor,
                ),
                label: 'Riwayat',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'asset/icon/Profile.png',
                  width: 20,
                  color: greyColor,
                ),
                label: 'Akun',
              ),
            ],
          ),
        ),
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
                style: whiteTextStyle.copyWith(fontSize: 18,),
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
                            label: 'Donasi Rutin',
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
                            onTap: () {},
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
                              DonationCard(),
                              DonationCard(),
                              DonationCard(),
                              DonationCard(),
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
                              ActivityReportCard(),
                              ActivityReportCard(),
                              ActivityReportCard(),
                              ActivityReportCard(),
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
                    margin: const EdgeInsets.only(
                      bottom: 0
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
                                  SizedBox(height: 2,),
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
