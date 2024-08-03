import 'package:finance_tracker/Screens/navpages/home_page.dart';
import 'package:finance_tracker/Screens/navpages/summary_page.dart';
import 'package:finance_tracker/Screens/navpages/user_profile_page.dart';
import 'package:finance_tracker/Screens/navpages/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List pages = [
    const HomePage(),
    const SummaryPage(),
    const WalletPage(),
    const UserProfilePage(),
  ];
  int currentIndex = 0;

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
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromRGBO(61, 77, 217, 1),
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: currentIndex == 0
                  ? const SvgIcon(
                      size: 29, icon: SvgIconData('assets/house.fill.svg'))
                  : const SvgIcon(
                      size: 27, icon: SvgIconData('assets/house.svg')),
              label: 'recent transactions'),
          BottomNavigationBarItem(
              icon: currentIndex == 1
                  ? const SvgIcon(
                      size: 27, icon: SvgIconData('assets/scroll.fill.svg'))
                  : const SvgIcon(
                      size: 25,
                      icon: SvgIconData('assets/scroll.svg'),
                    ),
              label: 'home'),
          BottomNavigationBarItem(
              icon: currentIndex == 2
                  ? const SvgIcon(
                      size: 23,
                      icon: SvgIconData('assets/wallet.bifold.fill.svg'))
                  : const SvgIcon(
                      size: 21,
                      icon: const SvgIconData('assets/wallet.bifold.svg')),
              label: 'wallet'),
          BottomNavigationBarItem(
              icon: currentIndex == 3
                  ? const SvgIcon(
                      size: 27, icon: SvgIconData('assets/gearshape.fill.svg'))
                  : const SvgIcon(
                      size: 25, icon: SvgIconData('assets/gearshape.svg')),
              label: 'user profile')
        ],
      ),
    );
  }
}
