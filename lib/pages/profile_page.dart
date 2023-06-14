import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
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
        backgroundColor: whiteColor,
        appBar: AppBar(
          toolbarHeight: 45,
          elevation: 0,
          titleTextStyle: darkTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
          centerTitle: true,
          backgroundColor: whiteColor,
          title: Column(
            children: [
              SizedBox(height: 13,),
              Text(
                'Riwayat Donasi',
                style: darkTextStyle,
              ),
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
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
                  ProfileMenuItem(
                    iconUrl: 'asset/icon/Logout.png',
                    title: 'Log Out',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 87,
            ),
          ],
        ),
      ),
    );
  }
}
