import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/widgets/profile_item.dart';

class MyWidget extends StatefulWidget {
  MyWidget({super.key});

  int _selectedIndex = 0;

  @override
  State<MyWidget> createState() => _MyWidgetState();

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });

  //   // Navigate to the page associated with the tapped item
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (BuildContext context) => _widgetOptions.elementAt(index),
  //     ),
  //   );
  // }

}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            )
                    ),
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
