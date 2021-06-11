import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_dm/screens/screens.dart';
import 'package:whatsapp_dm/utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isPlatformDark = WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    final initTheme = isPlatformDark ? Constant.darkTheme : Constant.lightTheme;
    return ThemeProvider(
      initTheme: initTheme,
      duration: const Duration(milliseconds: 200),
      builder: (_, initTheme) {
        return MaterialApp(
          localizationsDelegates: const [CountryLocalizations.delegate],
          debugShowCheckedModeBanner: false,
          title: 'WhatsApp DM',
          home: const MainScreen(),
          theme: initTheme,
        );
      },
    );
  }
}
