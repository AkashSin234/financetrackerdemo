import 'package:finance_tracker/Screens/navpages/home_page.dart';
import 'package:finance_tracker/Screens/navpages/summary_page.dart';
import 'package:finance_tracker/Screens/navpages/user_profile_page.dart';
import 'package:finance_tracker/Screens/navpages/wallet_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List pages = [
    SummaryPage(),
    HomePage(),
    WalletPage(),
    UserProfilePage(),
  ];
  int currentIndex = 1;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: 'recent transactions'),
          BottomNavigationBarItem(icon: Icon(FluentIcons.home_32_regular, ),
label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'wallet'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),label: 'user profile')
        ],
      ),
    );
  }
}
