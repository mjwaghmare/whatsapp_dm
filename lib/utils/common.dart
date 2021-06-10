import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonMethods {
  //open whatsapp with message
  static whatsAppWithMsg(BuildContext context, String countryCode, String number, String message) async {
    const snackBar = SnackBar(content: Text('Check the number or Try Again!!'));
    final String url = 'whatsapp://send?phone=$countryCode$number&text=$message';
    await canLaunch(url) ? launch(url) : ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //open whatsapp without message
  static whatsAppWithoutMsg(BuildContext context, String number) async {
    const snackBar = SnackBar(content: Text('Check the number or Try Again!!'));
    final String url = 'whatsapp://send?phone=$number';
    await canLaunch(url) ? launch(url) : ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
