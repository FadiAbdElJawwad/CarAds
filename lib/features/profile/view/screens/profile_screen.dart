import 'package:car_ads/common/primary_app_bar.dart';
import 'package:car_ads/core/constant/color_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/features/auth/logic/provider/auth_provider.dart';
import 'package:car_ads/features/profile/view/widgets/profile_header_card.dart';
import 'package:car_ads/features/profile/view/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthProvider>().fetchUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: PrimaryAppBar(text: 'Your Profile'),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          final user = authProvider.state.user;
          return ListView(
            children: [
              ProfileHeaderCard(
                name: user?.name ?? 'Loading...',
                phone: user?.phone ?? user?.email ?? '',
                profileImage: user?.profileImage,
              ),
              context.addVerticalSpace(35),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ProfileMenuItem(title: 'Payment Methods', onTap: () {}),
                      const Divider(color: ColorManager.backgroundColor),
                      ProfileMenuItem(title: 'Change Your Email', onTap: () {
                        AppRouter.goTo(screenName: ScreenName.changeEmailScreen);
                      }),
                      const Divider(color: ColorManager.backgroundColor),
                      ProfileMenuItem(title: 'Change Your Phone Number', onTap: () {
                        AppRouter.goTo(screenName: ScreenName.changePhoneScreen);
                      }),
                      const Divider(color: ColorManager.backgroundColor),
                      ProfileMenuItem(title: 'Change Your Password', onTap: () {
                        AppRouter.goTo(screenName: ScreenName.changePasswordScreen);
                      }),
                      const Divider(color: ColorManager.backgroundColor),
                      ProfileMenuItem(title: 'Change Language', onTap: () {
                        AppRouter.goTo(screenName: ScreenName.changeLanguageScreen);
                      }),
                      const Divider(color: ColorManager.backgroundColor),
                      ProfileMenuItem(title: 'FAQ’S', onTap: () {
                        AppRouter.goTo(screenName: ScreenName.faqScreenScreen);
                      }),
                      const Divider(color: ColorManager.backgroundColor),
                      ProfileMenuItem(title: 'Privacy Policy', onTap: () {
                        AppRouter.goTo(screenName: ScreenName.privacyPolicyScreen);
                      }),
                      const Divider(color: ColorManager.backgroundColor),
                      ProfileMenuItem(title: 'Terms & Conditions', onTap: () {
                        AppRouter.goTo(screenName: ScreenName.termsConditionsScreen);
                      }),
                      const Divider(color: ColorManager.backgroundColor),
                      ProfileMenuItem(
                        title: 'Logout',
                        onTap: () async {
                          await authProvider.logout();
                          if (context.mounted) {
                            AppRouter.goToAndRemove(screenName: ScreenName.login);
                          }
                        },
                        isLogout: true,
                        icon: Icons.logout,
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    ).padSymmetric(20);
  }
}
