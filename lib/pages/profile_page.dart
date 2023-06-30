import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/pages/login_page.dart';
import 'package:peduli_yatim_pens_mobile/widgets/profile_item.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: myColor,
        primarySwatch: myColor,
      ),
      home: Scaffold(
        backgroundColor: backgroundGreyColor,
        appBar: AppBar(
          toolbarHeight: 45,
          elevation: 0,
          titleTextStyle: darkTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              Text(
                'Riwayat Donasi',
                style: darkTextStyle,
              ),
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                        'asset/image/blank_profile.png',
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Bayu Hidayah',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ProfileMenuItem(
                    iconUrl: 'asset/icon/DonasiSaya.png',
                    title: 'Donasi Saya',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    iconUrl: 'asset/icon/InformasiAkun.png',
                    title: 'Informasi Akun',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    iconUrl: 'asset/icon/PusatBantuan.png',
                    title: 'Pusat Bantuan',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(7)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'asset/icon/Logout.png',
                                height: 22,
                                width: 22,
                                color: redColor,
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                              Text(
                                'Log Out',
                                style: darkTextStyle.copyWith(
                                  color: redColor,
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: redColor,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
