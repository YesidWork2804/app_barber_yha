import 'package:app_barber_yha/presentation/screens/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'my_icon_app_widget.dart';

class ButtonTopNavigatorWidget extends StatelessWidget {
  final bool buttonUser;

  const ButtonTopNavigatorWidget({super.key, this.buttonUser = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyIconAppWidget(
            fuction: () {
              Navigator.pop(context);
            },
            icon: Icons.arrow_back_ios,
            size: 30,
          ),
          () {
            if (!buttonUser) {
              return const SizedBox();
            } else {
              return MyIconAppWidget(
                fuction: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                },
                icon: Icons.account_circle,
              );
            }
          }(),
        ],
      ),
    );
  }
}
