import 'package:app_barber_yha/presentation/widgets/app/my_icon_app_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/theme/theme.dart';
import '../../../providers/theme/app_theme_provider.dart';

class ContainerButtonWidget extends StatefulWidget {
  final String textTitle;
  final IconData iconDataLeft;
  final VoidCallback fuction;

  const ContainerButtonWidget({
    super.key,
    required this.iconDataLeft,
    required this.textTitle,
    required this.fuction,
  });

  @override
  State<ContainerButtonWidget> createState() => _ContainerCheckBoxWidgetState();
}

class _ContainerCheckBoxWidgetState extends State<ContainerButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    return SizedBox(
      width: 320,
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(widget.iconDataLeft,
                      color: AppTheme.colorButton, size: 40),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(widget.textTitle,
                      style: themeProvider.theme.textTheme.bodyMedium),
                ],
              ),
              MyIconAppWidget(
                icon: Icons.arrow_forward_ios_outlined,
                fuction: widget.fuction,
                size: 35,
              )
              // MyIconAppWidget(icon: Icons.abc, fuction: () {}, size: 35),
            ],
          ),
          Divider(
            color: themeProvider.theme.cardColor,
            thickness: 2,
          )
        ],
      ),
    );
  }
}
