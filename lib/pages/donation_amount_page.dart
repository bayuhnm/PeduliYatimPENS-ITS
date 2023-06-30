import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/bloc/payment_method/payment_method_bloc.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/models/payment_method_model.dart';
import 'package:peduli_yatim_pens_mobile/pages/midtrans_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/payment_success.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peduli_yatim_pens_mobile/widgets/bank_item.dart';

class DonationAmountPage extends StatefulWidget {
  final String title;

  DonationAmountPage({
    Key? key,
    required this.title,
  });

  @override
  State<DonationAmountPage> createState() => _DonationAmountPageState();
}

class _DonationAmountPageState extends State<DonationAmountPage> {
  TextEditingController amountController = TextEditingController(text: '');
  PaymentMethodModel? selectedPaymentMethod;

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  void updateDonationValue(String value) {
    setState(() {
      amountController.text = value;
    });
  }

  String formatCurrency(String amount) {
    // Hapus semua karakter yang bukan digit
    String digitsOnly = amount.replaceAll(RegExp(r'[^\d]'), '');

    // Parsing sebagai integer
    int value = int.tryParse(digitsOnly) ?? 0;

    // Format nominal dengan titik sebagai digit
    String formatted = value.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');

    print(formatted);

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
        backgroundColor: backgroundGreyColor,
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
            'Donasi Anda',
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
                      builder: (context) =>
                          MidtransPage(amountDonation: amountController.text),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: whiteColor,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 30, bottom: 5),
                child: Text(
                  'Program Donasi',
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                color: whiteColor,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                child: Text(
                  widget.title,
                  style: darkTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: whiteColor,
                padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                height: 110,
                child: TextField(
                  style: greenTextStyle.copyWith(
                      fontSize: 20, fontWeight: semiBold),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    prefixText: 'Rp. ',
                    prefixStyle: darkTextStyle.copyWith(
                        fontSize: 20, fontWeight: semiBold),
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
                  controller: amountController,
                  onChanged: (value) {
                    String formatted = formatCurrency(value);
                    amountController.value = TextEditingValue(
                      text: formatted,
                      selection:
                          TextSelection.collapsed(offset: formatted.length),
                    );
                  },
                ),
              ),
              Container(
                color: whiteColor,
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DonationButton(
                          value: '20.000',
                          onPressed: () =>
                              updateDonationValue('20000'.toString()),
                        ),
                        DonationButton(
                          value: '50.000',
                          onPressed: () =>
                              updateDonationValue('50000'.toString()),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DonationButton(
                          value: '100.000',
                          onPressed: () =>
                              updateDonationValue('100000'.toString()),
                        ),
                        DonationButton(
                          value: '300.000',
                          onPressed: () =>
                              updateDonationValue('300000'.toString()),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DonationButton extends StatelessWidget {
  final String value;
  final VoidCallback onPressed;

  const DonationButton({
    required this.value,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 4 / 9,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: whiteColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: greenPrimaryColor),
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          value,
          style: greenTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
        ),
      ),
    );
  }
}
