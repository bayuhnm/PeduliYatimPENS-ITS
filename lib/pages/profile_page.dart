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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 22,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                      'asset/image/profile.jpg',
                    )),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: greenPrimaryColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Shayna Hanna',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ProfileMenuItem(
                  iconUrl: 'asset/image/Wallet.png',
                  title: 'Donasi Saya',
                  onTap: () async {},
                ),
                ProfileMenuItem(
                  iconUrl: 'asset/image/Akun.png',
                  title: 'Informasi Akun',
                  onTap: () async {},
                ),
                ProfileMenuItem(
                  iconUrl: 'asset/image/Akun.png',
                  title: 'Verifikasi Akun',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: 'asset/image/Gear.png',
                  title: 'Pengaturan',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: 'asset/image/Akun.png',
                  title: 'Pusat Bantuan',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: 'asset/image/Akun.png',
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
    );
  }
}
