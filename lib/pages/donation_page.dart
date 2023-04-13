import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';

class DonationPage extends StatelessWidget {
  const DonationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: myColor,
        primarySwatch: myColor,
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
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
              'Jumlah Donasi',
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
                        builder: (context) => DonationPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Lanjut ke Metode Pembayaran',
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
          body: Padding(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
              top: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Masukkan Jumlah Donasi Anda',
                  style:
                      darkTextStyle.copyWith(fontSize: 12, fontWeight: regular),
                ),
                SizedBox(height: 5,),
                TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Test',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
