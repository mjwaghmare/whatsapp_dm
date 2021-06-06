import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:whatsapp_dm/utils/colors.dart';

import 'screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  MotionTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = MotionTabController(initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  List<Widget> screens = [
    HomeScreen(),
    const AccountScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_tabController.index],
      bottomNavigationBar: MotionTabBar(
        labels: const ["Chat", "Home", "Dashboard"],
        initialSelectedTab: "Chat",
        tabIconColor: Constant.whatsappGreen,
        tabSelectedColor: Constant.whatsappGreen,
        onTabItemSelected: (int value) {
          setState(() {
            _tabController.index = value;
          });
        },
        icons: const [FontAwesomeIcons.whatsapp, Icons.home, Icons.account_circle_outlined],
        textStyle: TextStyle(color: Constant.black),
      ),
    );
  }
}
