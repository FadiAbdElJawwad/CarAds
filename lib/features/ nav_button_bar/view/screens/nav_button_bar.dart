import 'package:flutter/material.dart';
import '../../../../core/constant/images_manager.dart';
import '../../../auth/view/home_screen.dart';
import '../widgets/nav_button_item.dart';

class NavButtonBar extends StatefulWidget {
  const NavButtonBar({super.key});

  @override
  State<NavButtonBar> createState() => _NavButtonBarState();
}

class _NavButtonBarState extends State<NavButtonBar> {

  int _currentIndex = 0;
  Widget currentScreen = HomeScreen();

  final PageStorageBucket bucket = PageStorageBucket();

  void _onItemTapped(int index, Widget screen) {
    setState(() {
      _currentIndex = index;
      currentScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavButtonItem(
              itemIndex: 0,
              currentIndex: _currentIndex,
              onPressed: () => _onItemTapped(0, const HomeScreen()),
              selectedIcon: ImagesManager.selectedHome,
              unselectedIcon: ImagesManager.home,
              label: 'Home',
              screen: const HomeScreen(),
            ),
            NavButtonItem(
              itemIndex: 1,
              currentIndex: _currentIndex,
              onPressed: () => _onItemTapped(1, const HomeScreen()),
              selectedIcon: ImagesManager.selectedExplore,
              unselectedIcon: ImagesManager.explore,
              label: 'Explore',
              screen: const HomeScreen(),
            ),
            NavButtonItem(
              itemIndex: 2,
              currentIndex: _currentIndex,
              onPressed: () => _onItemTapped(2, const HomeScreen()),
              selectedIcon: ImagesManager.selectedAdd,
              unselectedIcon: ImagesManager.add,
              label: 'Add',
              screen: const HomeScreen(),
            ),
            NavButtonItem(
              itemIndex: 3,
              currentIndex: _currentIndex,
              onPressed: () => _onItemTapped(3, const HomeScreen()),
              selectedIcon: ImagesManager.selectedHistory,
              unselectedIcon: ImagesManager.history,
              label: 'History',
              screen: const HomeScreen(),
            ),
            NavButtonItem(
              itemIndex: 4,
              currentIndex: _currentIndex,
              onPressed: () => _onItemTapped(4, const HomeScreen()),
              selectedIcon: ImagesManager.selectedProfile,
              unselectedIcon: ImagesManager.profile,
              label: 'Profile',
              screen: const HomeScreen(),
            ),

          ],
        ),
      ),
    );
  }
}

