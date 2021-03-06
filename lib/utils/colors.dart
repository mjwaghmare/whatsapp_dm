import 'package:flutter/material.dart';

class Constant {
  //Colors
  static Color black = const Color(0xff4B4B4B);
  static Color darkBlue = const Color(0xff05102E);
  static Color lightBlue = const Color(0xff80b7f5);
  static Color silver = const Color(0xffB7B7B7);
  static Color whatsappGreen = const Color(0xff25D366);
  static Color white = const Color(0xffF2F2F2);

  //Fonts
  static String poppins = 'Poppins';

  // theme: ThemeData(
  // accentColor: const Color(0xff25D366),
  // brightness: Brightness.light,
  // visualDensity: VisualDensity.adaptivePlatformDensity,
  // textTheme: GoogleFonts.nunitoSansTextTheme(
  // Theme.of(context).textTheme,
  // ),
  // ),

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff25D366),
    accentColor: const Color(0xff05102E),
    hintColor: const Color(0xff05102E),
    textTheme: const TextTheme(
      headline6: TextStyle(
        color: Colors.white,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xff25D366),
    accentColor: const Color(0xff05102E),
    hintColor: const Color(0xff25D366),
    textTheme: const TextTheme(
      headline6: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
