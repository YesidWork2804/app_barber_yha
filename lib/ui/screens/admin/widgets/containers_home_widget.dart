import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme/app_theme_provider.dart';

class ContainersHomeWidget extends StatelessWidget {
  final String photo;
  final String text;
  final VoidCallback onTap;
  final double heightPhoto;

  const ContainersHomeWidget(
      {super.key,
      required this.photo,
      required this.text,
      required this.onTap,
      this.heightPhoto = 90});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: themeProvider.theme.cardColor,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              photo,
              height: heightPhoto,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: themeProvider.theme.textTheme.bodySmall!
                  .copyWith(fontSize: 12),
            )
          ],
        )),
      ),
    );
  }
}
