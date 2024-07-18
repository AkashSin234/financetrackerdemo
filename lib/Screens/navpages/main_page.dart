import 'package:finance_tracker/Screens/navpages/home_page.dart';
import 'package:finance_tracker/Screens/navpages/summary_page.dart';
import 'package:finance_tracker/Screens/navpages/user_profile_page.dart';
import 'package:finance_tracker/Screens/navpages/wallet_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'wallet'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded), label: 'user profile')
        ],
      ),
    );
  }
}
