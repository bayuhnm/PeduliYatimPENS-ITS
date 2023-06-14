import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/widgets/card_history.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
        appBar: CustomAppBar(),
        body: Container(
          decoration: BoxDecoration(color: backgroundGreyColor),
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            children: [
              HistoryCard(),
              HistoryCard(),

            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize =>
      Size.fromHeight(120); // Increase the height to accommodate the dropdowns
}

class _CustomAppBarState extends State<CustomAppBar> {
  String selectedMonth = DateFormat('MMMM').format(DateTime.now());
  int selectedYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 120,
      elevation: 0,
      titleTextStyle: darkTextStyle.copyWith(
        fontSize: 18,
        fontWeight: medium,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.translate(
            offset: Offset(10, 10),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
              child: Container(color: Colors.white.withOpacity(0.0)),
            ),
          ),
          Text('Riwayat Donasi', style: darkTextStyle,),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, right: 10),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(8)),
                child: DropdownButton<String>(
                  dropdownColor: whiteColor,
                  underline: SizedBox(),
                  value: selectedMonth,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMonth = newValue!;
                    });
                  },
                  items: <String>[
                    'January',
                    'February',
                    'March',
                    'April',
                    'May',
                    'June',
                    'July',
                    'August',
                    'September',
                    'October',
                    'November',
                    'December',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: darkTextStyle.copyWith(fontSize: 14),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.only(left: 20, right: 10),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(8)),
                child: DropdownButton<int>(
                  underline: SizedBox(),
                  value: selectedYear,
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedYear = newValue!;
                    });
                  },
                  items: List<int>.generate(
                          7, (index) => DateTime.now().year - index)
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(
                        value.toString(),
                        style: darkTextStyle.copyWith(fontSize: 14),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
        ],
      ),
    );
  }
}
