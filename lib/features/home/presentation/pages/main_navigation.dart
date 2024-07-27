import 'package:e_cloth/features/home/presentation/pages/home_page.dart';
import 'package:e_cloth/features/profile/presentation/pages/profile_page.dart';
import 'package:e_cloth/features/wishlist/presentation/pages/wishlist_page.dart';
import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    WishlistPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey, 
                    width: 0.5, 
                  ),
                ),
              ),
              height: 80,
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Assets.icons.home.image(
                      color: _selectedIndex == 0 ? Colors.red : Colors.black,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Assets.icons.likeBorder.image(
                      color: _selectedIndex == 1 ? Colors.red : Colors.black,
                    ),
                    label: 'Wishlist',
                  ),
                  BottomNavigationBarItem(
                    icon: Assets.icons.profile.image(
                      color: _selectedIndex == 2 ? Colors.red : Colors.black,
                    ),
                    label: 'Profile',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.red,
                unselectedItemColor: Colors.black,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                onTap: _onItemTapped,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
