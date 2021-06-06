import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_dm/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [CountryLocalizations.delegate],
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp DM',
      theme: ThemeData(accentColor: const Color(0xff25D366), brightness: Brightness.light),
      home: const MainScreen(),
    );
  }
}
