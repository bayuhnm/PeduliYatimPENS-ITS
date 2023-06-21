import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';

class ProfileMenuItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback? onTap;

  const ProfileMenuItem({
    Key? key,
    required this.iconUrl,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 10
        ),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(7)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  iconUrl,
                  height: 22,
                  width: 22,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  title,
                  style: darkTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: darkColor,
            )
          ],
        ),
      ),
    );
  }
}
