import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/pages/donation_list_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/history_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/home_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final Color _selectedItemColor = greenPrimaryColor;
  bool _showNavigationBar = true;

  final List<Widget> _pages = [
    HomePage(),
    DonationListPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  final List<bool> _isSelected = [true, false, false, false];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      for (int i = 0; i < _isSelected.length; i++) {
        _isSelected[i] = (i == index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: _showNavigationBar ?  BottomAppBar(
          color: whiteColor,
          shape: const CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          notchMargin: 6,
          elevation: 3,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: whiteColor,
            elevation: 0,
            selectedItemColor: _selectedItemColor,
            unselectedItemColor: greyColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: greenTextStyle.copyWith(
              fontSize: 10,
              fontWeight: medium,
            ),
            unselectedLabelStyle: greyTextStyle.copyWith(
              fontSize: 10,
              fontWeight: medium,
            ),
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
            items: [
              _buildBottomNavigationBarItem(
                  'asset/icon/Home2.png', 'Beranda', 0),
              _buildBottomNavigationBarItem(
                  'asset/icon/Donation2.png', 'Donasi', 1), 
              _buildBottomNavigationBarItem(
                  'asset/icon/History2.png', 'Riwayat', 2),
              _buildBottomNavigationBarItem(
                  'asset/icon/Profile2.png', 'Akun', 3),
            ],
          ),
        )
        : null,
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      String iconPath, String label, int index) {
    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            iconPath,
            width: 20,
          ),
          Opacity(
            opacity: _isSelected[index] ? 1.0 : 0.0,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                _selectedItemColor,
                BlendMode.srcIn,
              ),
              child: Image.asset(
                iconPath,
                width: 20,
              ),
            ),
          ),
        ],
      ),
      label: label,
    );
  }
}
