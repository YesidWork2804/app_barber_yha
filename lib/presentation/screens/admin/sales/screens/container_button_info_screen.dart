// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../../../app/theme/theme.dart';
// import '../../../../providers/providers.dart';

// class ContinaerButtonInfoScreen extends StatefulWidget {
//   final bool client;
//   const ContinaerButtonInfoScreen({super.key, required this.client});

//   @override
//   State<ContinaerButtonInfoScreen> createState() =>
//       _ContinaerButtonInfoScreenState();
// }

// // bool client = true;

// class _ContinaerButtonInfoScreenState extends State<ContinaerButtonInfoScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<AppThemeProvider>(context);

//     // void buttonClient() {
//     //   setState(() {
//     //     client = !widget.client;
//     //     print(widget.client);
//     //   });
//     // }

//     return SizedBox(
//       width: widget.client ? 200 : 150,
//       height: 40,
//       child: TextButton(
//           onPressed: () {
//             buttonClient();
//           },
//           style: ButtonStyle(
//             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//               RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
//               ),
//             ),
//             backgroundColor:
//                 MaterialStateProperty.all<Color>(AppTheme.colorButton),
//             // Color de fondo del botón
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Text(
//                 widget.client ? 'Vender a un Cliente' : 'Venta Rapida',
//                 style: themeProvider.theme.textTheme.bodySmall,
//               ),
//               Icon(
//                 Icons.arrow_drop_down,
//                 color: themeProvider.theme.primaryColor,
//                 size: 25,
//               )
//             ],
//           )),
//     );
//   }
// }
