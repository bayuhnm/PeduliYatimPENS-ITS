import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';

class HomeDonationCategory extends StatelessWidget {
  final String iconUrl;
  final String label;
  final VoidCallback? onTap;

  const HomeDonationCategory({
    Key? key,
    required this.iconUrl,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        child: Column(
          children: [
            Center(
              child: Image.asset(
                iconUrl,
                width: 40,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              label,
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreDialog extends StatelessWidget {
  const MoreDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        height: 180,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: whiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Program Donasi Lainnya',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeDonationCategory(
                    iconUrl: 'asset/icon/Swakelola.png',
                    label: 'Swakelola',
                    onTap: () {},
                  ),
                  HomeDonationCategory(
                    iconUrl: 'asset/icon/WaqafTanah.png',
                    label: 'Waqaf Tanah',
                    onTap: () {},
                  ),
                  HomeDonationCategory(
                    iconUrl: 'asset/icon/Modal.png',
                    label: 'Modal',
                    onTap: () {},
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
