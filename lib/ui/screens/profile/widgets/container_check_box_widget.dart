import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/theme/theme.dart';
import '../../../providers/theme/app_theme_provider.dart';

class ContainerCheckBoxWidget extends StatefulWidget {
  final String textTitle;
  final IconData iconDataLeft;
  final String textInfo;

  const ContainerCheckBoxWidget(
      {super.key,
      required this.iconDataLeft,
      required this.textTitle,
      required this.textInfo});

  @override
  State<ContainerCheckBoxWidget> createState() =>
      _ContainerCheckBoxWidgetState();
}

class _ContainerCheckBoxWidgetState extends State<ContainerCheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return Container(
      color: themeProvider.theme.colorScheme.background,
      width: 320,
      height: 80,
      child: Column(
        //
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.textTitle,
                          style: themeProvider.theme.textTheme.bodyMedium),
                      SizedBox(
                        width: 200,
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          widget.textInfo,
                          style:
                              themeProvider.theme.textTheme.bodyLarge?.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                child: Transform.scale(
                  scale: 1.3,
                  child: Checkbox(
                      activeColor: AppTheme.colorButton,
                      checkColor: themeProvider.theme.colorScheme.background,
                      value: true, // Estado actual del checkbox
                      onChanged: (bool? value) {
                        setState(() {});
                      }),
                ),
              ),
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
