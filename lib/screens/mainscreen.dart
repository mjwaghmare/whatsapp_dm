import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsapp_dm/utils/colors.dart';

import 'screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    const CallLogs(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constant.whatsappGreen.withOpacity(0.8),
          centerTitle: true,
          title: const Text('WhatsApp DM '),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ThemeSwitcher(
                builder: (context) {
                  return IconButton(
                    onPressed: () {
                      ThemeSwitcher.of(context).changeTheme(
                        theme: ThemeProvider.of(context).brightness == Brightness.light
                            ? Constant.darkTheme
                            : Constant.lightTheme,
                      );
                    },
                    icon: Icon(
                        ThemeProvider.of(context).brightness == Brightness.light
                            ? Icons.brightness_3
                            : Icons.wb_sunny_rounded,
                        size: 20),
                  );
                },
              ),
            )
          ],
        ),
        body: screens[selectedIndex],
        bottomNavigationBar: navBar(selectedIndex));
  }

  Widget navBar(int selectedIndex) {
    return FlashyTabBar(
      selectedIndex: selectedIndex,
      onItemSelected: (int index) => changeTab(index),
      items: [
        FlashyTabBarItem(
          icon: Icon(
            FontAwesomeIcons.whatsapp,
            color: Constant.whatsappGreen,
          ),
          title: Text(
            'Chat',
            style: TextStyle(
              color: Constant.whatsappGreen,
            ),
          ),
        ),
        FlashyTabBarItem(
          icon: Icon(
            Icons.call_outlined,
            color: Constant.whatsappGreen,
          ),
          title: Text(
            'Call Logs',
            style: TextStyle(
              color: Constant.whatsappGreen,
            ),
          ),
        ),
      ],
    );
  }

  changeTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
