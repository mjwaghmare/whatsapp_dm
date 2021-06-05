import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_dm/utils/colors.dart';
import 'package:whatsapp_dm/utils/cutomMessages.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final wpNumber = TextEditingController();
  final wpMessage = TextEditingController();
  String _countryCode = '+91';

  @override
  void dispose() {
    super.dispose();
    wpNumber.dispose();
    wpMessage.dispose();
  }

  void launchWhatsApp(String countryCode, String number, String message) async {
    // String code;
    // if (countryCode != null) {
    //   code = countryCode;
    // } else {
    //   code = "+91";
    // }
    const snackBar = SnackBar(content: Text('Check the number or Try Again!!'));
    final String url = 'whatsapp://send?phone=$countryCode$number&text=$message';
    print(url);
    await canLaunch(url) ? launch(url) : ScaffoldMessenger.of(context).showSnackBar(snackBar);
    wpMessage.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constant.black,
        centerTitle: true,
        title: const Text('WhatsApp DM '),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Send whatsapp messages without saving the number',
                style: TextStyle(fontSize: 16),
              ),
              Container(
                height: 60,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CountryCodePicker(
                      padding: const EdgeInsets.only(bottom: 19.0),
                      initialSelection: 'IN',
                      showCountryOnly: true,
                      favorite: const ['+91', 'IN'],
                      searchDecoration: const InputDecoration(hintText: 'Search Country'),
                      onChanged: (code) {
                        setState(() {
                          _countryCode = code.dialCode.toString();
                        });
                      },
                      flagDecoration: const BoxDecoration(shape: BoxShape.circle),
                      flagWidth: 40,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding: const EdgeInsets.only(top: 20),
                          alignment: Alignment.bottomCenter,
                          child: TextField(
                            maxLength: 10,
                            controller: wpNumber,
                            cursorColor: Constant.black,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(borderSide: BorderSide.none),
                              hintText: '0123456789',
                              prefixIcon: FaIcon(
                                FontAwesomeIcons.whatsapp,
                                color: Constant.whatsappGreen,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                alignment: Alignment.bottomCenter,
                child: TextField(
                  controller: wpMessage,
                  cursorColor: Constant.black,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    hintText: 'Message',
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 5.0,
                children: [
                  for (int i = 0; i < CustomData.customMessages.length; i++) ...{
                    GestureDetector(
                      onTap: () {
                        print(CustomData.customMessages[i]);
                        wpMessage.text = CustomData.customMessages[i].toString();
                      },
                      child: Chip(
                        label: Text(CustomData.customMessages[i]),
                      ),
                    )
                  }
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Constant.whatsappGreen),
                  onPressed: () {
                    launchWhatsApp(
                      _countryCode,
                      wpNumber.text.trim().toString(),
                      wpMessage.text.toString(),
                    );
                  },
                  child: const Text('Send'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
