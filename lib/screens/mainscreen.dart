import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:whatsapp_dm/utils/colors.dart';

import 'screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  MotionTabController _tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = MotionTabController(initialIndex: selectedIndex, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

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
        ),
        body: screens[selectedIndex],
        // bottomNavigationBar: MotionTabBar(
        //   labels: const ["Chat", "Call Logs"],
        //   initialSelectedTab: "Chat",
        //   tabIconColor: Constant.whatsappGreen,
        //   tabSelectedColor: Constant.whatsappGreen,
        //   onTabItemSelected: (int value) {
        //     setState(() {
        //       selectedIndex = value;
        //     });
        //   },
        //   icons: const [
        //     FontAwesomeIcons.whatsapp,
        //     Icons.call_outlined,
        //     // Icons.account_circle_outlined
        //   ],
        //   textStyle: TextStyle(color: Constant.black),
        // ));
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
