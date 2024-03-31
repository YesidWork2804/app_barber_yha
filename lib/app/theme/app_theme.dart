import 'package:flutter/material.dart';

class AppTheme {
// Colores app
  static const Color secondaryColor = Color(0xff7B7B7B);
  static const Color colorButton = Color(0xffE95401);

  // Dark
  static const Color colorFormTextDark = Color(0xff7B7B7B);

  //Light
  // static const Color colorPrimarylightTheme = Color(0xff1A1A1A);

  // FontSizes
  static const double fontSize = 20;

  static final ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xff1A1A1A),
    cardColor: const Color(0xffEAE7E1),
    secondaryHeaderColor: const Color(0xffEAE7E1),
    colorScheme: const ColorScheme.light(
        onPrimary: Colors.white, background: Color(0xffFFFFF6)),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: fontSize,
        color: Color(0xff1A1A1A), // Color del texto en modo claro
        fontWeight: FontWeight.bold,
        fontFamily: "Poppins",
      ),
      bodySmall: TextStyle(
        fontSize: 18,
        color: Color(0xff1A1A1A), // Color del texto en modo claro
        fontFamily: "Poppins",
      ),
    ),

    // Otros atributos de tema
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xffEAE7E1),
    cardColor: const Color(0xff232323),
    secondaryHeaderColor: const Color(0xff232323),
    colorScheme: const ColorScheme.dark(
        onPrimary: Colors.white, background: Color(0xff1A1A1A)),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: fontSize,
        color: Color(0xffEAE7E1), // Color del texto en modo oscuro
        fontWeight: FontWeight.bold,
        fontFamily: "Poppins",
      ),
      bodySmall: TextStyle(
        fontSize: 18,
        color: Color(0xffEAE7E1), // Color del texto en modo claro
        fontFamily: "Poppins",
      ),
      // Agregar más estilos de texto según sea necesario
    ),
  );
}
