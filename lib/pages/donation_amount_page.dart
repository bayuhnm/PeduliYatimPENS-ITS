import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/pages/payment_success.dart';

class DonationAmountPage extends StatefulWidget {
  const DonationAmountPage({super.key});

  @override
  State<DonationAmountPage> createState() => _DonationAmountPageState();
}

class _DonationAmountPageState extends State<DonationAmountPage> {
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String formatCurrency(String amount) {
    // Hapus semua karakter yang bukan digit
    String digitsOnly = amount.replaceAll(RegExp(r'[^\d]'), '');

    // Parsing sebagai integer
    int value = int.tryParse(digitsOnly) ?? 0;

    // Format nominal dengan titik sebagai digit
    String formatted = value.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');

    // Tambahkan "Rp." di depan nominal
    return '$formatted';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: myColor,
        primarySwatch: myColor,
      ),
      home: Scaffold(
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
                      builder: (context) => PaymentSuccessPage(),
                    ),
                  );
                },
                child: Text(
                  'Lanjutkan Pembayaran',
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
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 15, right: 15, top: 30),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: TextField(
                  style: greenTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    prefixText: 'Rp. ',
                    prefixStyle: darkTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold
                    ),
                    labelText: "Jumlah Donasi",
                    labelStyle: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 1.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: greenPrimaryColor, width: 1.2),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  keyboardType: TextInputType.number,
                  controller: _controller,
                  onChanged: (value) {
                    String formatted = formatCurrency(value);
                    _controller.value = TextEditingValue(
                      text: formatted,
                      selection:
                          TextSelection.collapsed(offset: formatted.length),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
