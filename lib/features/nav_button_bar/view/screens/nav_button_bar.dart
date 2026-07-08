import 'package:car_ads/features/auth/logic/provider/auth_provider.dart';
import 'package:car_ads/features/showroom/view/screens/showroom_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constant/images_manager.dart';
import '../../../../generated/l10n.dart';
import '../../../add_ads/view/screens/add_ads_screen.dart';
import '../../../history/view/screens/history_screen.dart';
import '../../../explore/view/screens/car_ads_screen.dart';
import '../../../home/view/screens/home_screen.dart';
import '../../../profile/view/screens/profile_screen.dart';
import '../../../showroom/view/screens/requests_screen.dart';
import '../../../showroom/view/screens/showroom_profile_screen.dart';
import '../../provider/nav_button_provider.dart';
import '../widgets/nav_button_item.dart';

class NavButtonBar extends StatefulWidget {
  const NavButtonBar({super.key});

  @override
  State<NavButtonBar> createState() => _NavButtonBarState();
}

class _NavButtonBarState extends State<NavButtonBar> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authProvider = context.read<AuthProvider>();
      if (authProvider.state.user == null) {
        authProvider.checkLoginStatus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    if (authProvider.state.isLoading || authProvider.state.user == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final role = authProvider.state.user?.role ?? 'user';

    final List<Widget> screens = [
      role == 'showroom'
          ? const ShowroomHomeScreen(key: PageStorageKey('ShowroomHomeScreen'))
          : const HomeScreen(key: PageStorageKey('HomeScreen')),
      const CarAdsScreen(key: PageStorageKey('CarAdsScreen')),
      const AddAdsScreen(key: PageStorageKey('AddAdsScreen')),
      role == 'showroom'
          ? const RequestsScreen(key: PageStorageKey('RequestsScreen'))
          : const HistoryScreen(key: PageStorageKey('HistoryScreen')),
      role == 'showroom'
          ? const ShowroomProfileScreen(
              key: PageStorageKey('ShowroomProfileScreen'),
            )
          : const ProfileScreen(key: PageStorageKey('ProfileScreen')),
    ];

    return Consumer<NavButtonProvider>(
      builder: (context, model, child) {
        return Scaffold(
          body: IndexedStack(index: model.currentIndex, children: screens),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavButtonItem(
                  itemIndex: 0,
                  currentIndex: model.currentIndex,
                  onPressed: () => model.onItemTapped(0),
                  selectedIcon: ImagesManager.selectedHome,
                  unselectedIcon: ImagesManager.home,
                  label: S.of(context).home,
                ),
                NavButtonItem(
                  itemIndex: 1,
                  currentIndex: model.currentIndex,
                  onPressed: () => model.onItemTapped(1),
                  selectedIcon: ImagesManager.selectedExplore,
                  unselectedIcon: ImagesManager.explore,
                  label: S.of(context).explore,
                ),
                NavButtonItem(
                  itemIndex: 2,
                  currentIndex: model.currentIndex,
                  onPressed: () => model.onItemTapped(2),
                  selectedIcon: ImagesManager.selectedAdd,
                  unselectedIcon: ImagesManager.add,
                  label: S.of(context).add,
                ),
                NavButtonItem(
                  itemIndex: 3,
                  currentIndex: model.currentIndex,
                  onPressed: () => model.onItemTapped(3),
                  selectedIcon: role == 'showroom'
                      ? ImagesManager.selectedRequest
                      : ImagesManager.selectedHistory,
                  unselectedIcon: role == 'showroom'
                      ? ImagesManager.request
                      : ImagesManager.history,
                  label: role == 'showroom' ? 'Request' : S.of(context).history,
                ),
                NavButtonItem(
                  itemIndex: 4,
                  currentIndex: model.currentIndex,
                  onPressed: () => model.onItemTapped(4),
                  selectedIcon: ImagesManager.selectedProfile,
                  unselectedIcon: ImagesManager.profile,
                  label: S.of(context).profile,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
