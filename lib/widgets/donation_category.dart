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
