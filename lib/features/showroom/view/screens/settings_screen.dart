import 'package:car_ads/common/loading_overlay.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/features/auth/logic/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/primary_app_bar.dart';
import '../../../../core/constant/color_manager.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/routes/screen_name.dart';
import '../../../profile/view/widgets/profile_menu_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        return LoadingOverlay(
          isLoading: authProvider.state.isLoading,
          child: Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: PrimaryAppBar(text: 'Settings', backIconVisible: true),
            ),
            body: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ProfileMenuItem(title: 'Payment Methods', onTap: () {}),
                    const Divider(color: ColorManager.backgroundColor),
                    ProfileMenuItem(
                      title: 'Change Your Email',
                      onTap: () {
                        AppRouter.goTo(
                          screenName: ScreenName.changeEmailScreen,
                        );
                      },
                    ),
                    const Divider(color: ColorManager.backgroundColor),
                    ProfileMenuItem(
                      title: 'Change Your Phone Number',
                      onTap: () {
                        AppRouter.goTo(
                          screenName: ScreenName.changePhoneScreen,
                        );
                      },
                    ),
                    const Divider(color: ColorManager.backgroundColor),
                    ProfileMenuItem(
                      title: 'Change Your Password',
                      onTap: () {
                        AppRouter.goTo(
                          screenName: ScreenName.changePasswordScreen,
                        );
                      },
                    ),
                    const Divider(color: ColorManager.backgroundColor),
                    ProfileMenuItem(
                      title: 'Change Language',
                      onTap: () {
                        AppRouter.goTo(
                          screenName: ScreenName.changeLanguageScreen,
                        );
                      },
                    ),
                    const Divider(color: ColorManager.backgroundColor),
                    ProfileMenuItem(
                      title: 'FAQ’S',
                      onTap: () {
                        AppRouter.goTo(screenName: ScreenName.faqScreenScreen);
                      },
                    ),
                    const Divider(color: ColorManager.backgroundColor),
                    ProfileMenuItem(
                      title: 'Privacy Policy',
                      onTap: () {
                        AppRouter.goTo(
                          screenName: ScreenName.privacyPolicyScreen,
                        );
                      },
                    ),
                    const Divider(color: ColorManager.backgroundColor),
                    ProfileMenuItem(
                      title: 'Terms & Conditions',
                      onTap: () {
                        AppRouter.goTo(
                          screenName: ScreenName.termsConditionsScreen,
                        );
                      },
                    ),
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
            ).padSymmetric(20).padVerticalSymmetric(16),
          ),
        );
      },
    );
  }
}
