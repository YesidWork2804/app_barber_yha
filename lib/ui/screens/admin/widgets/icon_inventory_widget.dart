import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/providers.dart';
import '../../../widgets/widgets.dart';

class IconAdminWidget extends StatelessWidget {
  final String text;
  final IconData iconData;
  final VoidCallback fuction;

  const IconAdminWidget(
      {super.key,
      required this.text,
      required this.iconData,
      required this.fuction});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return Row(
      children: [
        MyIconAppWidget(
          icon: iconData,
          fuction: fuction,
          size: 35,
        ),
        Text(
          text,
          style: themeProvider.theme.textTheme.bodySmall!
              .copyWith(fontWeight: FontWeight.normal, fontSize: 12),
        )
      ],
    );
  }
}
