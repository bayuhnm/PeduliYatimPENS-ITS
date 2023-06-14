import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/pages/home_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/main_page%20copy.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pembayaran Donasi\n Berhasil',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 26,),
            Icon(Icons.check_circle, size: 70, color: greenPrimaryColor,),
            const SizedBox(
              height: 26,
            ),
            Text(
              'Terima kasih orang baik\n kebaikan akan kembali kepada anda',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(
              height: 50,
            ),
            Container(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Kembali ke Beranda',
                    style: whiteTextStyle.copyWith(fontWeight: medium),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkColor,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // set the desired radius
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}