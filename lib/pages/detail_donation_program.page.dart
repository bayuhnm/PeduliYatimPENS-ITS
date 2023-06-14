import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/pages/donation_amount_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/donation_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/topup_amount_page.dart';
import 'package:peduli_yatim_pens_mobile/widgets/text_wrapper.dart';
import '../widgets/percentage_bar.dart';

class DetailDonationPage extends StatelessWidget {
  const DetailDonationPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool _showNavigationBar = false;

    return MaterialApp(
      theme: ThemeData(
        primaryColor: myColor,
        primarySwatch: myColor,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            color: darkColor,
            icon: Icon(Icons.arrow_back, color: darkColor,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            'Detail Donasi',
            style: darkTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
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
                      builder: (context) => DonationAmountPage(),
                    ),
                  );
                },
                child: Text(
                  'Donasi Sekarang',
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
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: EdgeInsets.only(left: 15, right:15, top: 5, bottom: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(
                          'asset/image/imageA2.jpg',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        Text(
                          'Bantu Pembangunan Masjid Jami Al-Mukminin',
                          style: darkTextStyle.copyWith(
                            height: 1.2,
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: const Offset(0, 0),
                              ),
                              BoxShadow(
                                color: Colors.grey.shade300,
                                spreadRadius: 0,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: screenWidth - 90,
                                    child: PercentageBar(
                                      percentage: 30,
                                      width: screenWidth - 90,
                                    ),
                                  ),
                                  Text(
                                    '39%',
                                    style: greenTextStyle.copyWith(
                                        fontSize: 14, fontWeight: bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Terkumpul',
                                style: greyTextStyle.copyWith(
                                    fontSize: 12, fontWeight: medium),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Rp. 67.000.000',
                                    style: greenTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: bold,
                                    ),
                                  ),
                                  Text(
                                    ' / ',
                                    style: greyTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: medium,
                                    ),
                                  ),
                                  Text(
                                    '400.000.000',
                                    style: greyTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: medium,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Sisa',
                                style: greyTextStyle.copyWith(
                                    fontSize: 12, fontWeight: medium),
                              ),
                              Text(
                                '39 Hari Lagi',
                                style: darkTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: const [
                                TextWrapper(
                                    text:
                                        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Can sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui."),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
