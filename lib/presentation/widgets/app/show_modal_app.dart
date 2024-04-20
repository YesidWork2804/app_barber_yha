import 'dart:async';
import 'package:app_barber_yha/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';

void ShowModalApp({
  required BuildContext context,
  required String message,
  required MessageType type,
}) {
  bool isModalOpen = true;
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      final themeProvider = Provider.of<AppThemeProvider>(context);
      Timer(const Duration(seconds: 3), () {
        if (isModalOpen) {
          Navigator.of(context).pop();
        }
      });
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: themeProvider.theme.cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          border: const Border(
            top: BorderSide(
              color: AppTheme.colorButton,
              width: 3, // Ancho del borde superior
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            MessageWidget(message: message, type: type),
            const SizedBox(height: 20),
          ],
        ),
      );
    },
  ).then((value) {
    // El código aquí se ejecutará cuando el modal se cierre
    isModalOpen = false; // Marca el modal como cerrado
  });
}

enum MessageType {
  info,
  error,
  success,
}

class MessageWidget extends StatelessWidget {
  final String message;
  final MessageType type;

  const MessageWidget({Key? key, required this.message, required this.type})
      : super(key: key);

  Color _getColorByType(MessageType type) {
    switch (type) {
      case MessageType.info:
        return Colors.yellow;
      case MessageType.error:
        return Colors.red;
      case MessageType.success:
        return Colors.green;
    }
  }

  IconData _getIconByType(MessageType type) {
    switch (type) {
      case MessageType.info:
        return Icons.info;
      case MessageType.error:
        return Icons.error;
      case MessageType.success:
        return Icons.check_circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return Row(
      children: [
        Icon(
          _getIconByType(type),
          color: _getColorByType(type),
          size: 30,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            message,
            style: themeProvider.theme.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.normal),
            // style: TextStyle(
            //   color: _getColorByType(type),
            //   fontSize: 16,
            // ),
          ),
        ),
      ],
    );
  }
}
