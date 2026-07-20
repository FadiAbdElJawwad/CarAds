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
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: PrimaryAppBar(
                text: context.loc.settingsTitle,
                backIconVisible: true,
              ),
            ),
            body: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ProfileMenuItem(
                      title: context.loc.paymentMethods,
                      onTap: () {},
                    ),
                    const Divider(color: ColorManager.backgroundColor),
                    ProfileMenuItem(
                      title: context.loc.changeYourEmailMenu,
                      onTap: () {
                        AppRouter.goTo(
                          screenName: ScreenName.changeEmailScreen,
                        );
                      },
                    ),
                    const Divider(color: ColorManager.backgroundColor),
                    ProfileMenuItem(
                      title: context.loc.changeYourPhoneMenu,
                      onTap: () {
                        AppRouter.goTo(
                          screenName: ScreenName.changePhoneScreen,
                        );
                      },
                    ),
                    const Divider(color: ColorManager.backgroundColor),
                    ProfileMenuItem(
                      title: context.loc.changeYourPasswordMenu,
                      onTap: () {
                        AppRouter.goTo(
                          screenName: ScreenName.changePasswordScreen,
                        );
                      },
                    ),
                    const Divider(color: ColorManager.backgroundColor),
                    ProfileMenuItem(
                      title: context.loc.changeLanguageTitle,
                      onTap: () {
                        AppRouter.goTo(
                          screenName: ScreenName.changeLanguageScreen,
                        );
                      },
                    ),
                    const Divider(color: ColorManager.backgroundColor),
                    ProfileMenuItem(
                      title: context.loc.faqsTitle,
                      onTap: () {
                        AppRouter.goTo(screenName: ScreenName.faqScreenScreen);
                      },
                    ),
                    const Divider(color: ColorManager.backgroundColor),
                    ProfileMenuItem(
                      title: context.loc.privacyPolicyTitle,
                      onTap: () {
                        AppRouter.goTo(
                          screenName: ScreenName.privacyPolicyScreen,
                        );
                      },
                    ),
                    const Divider(color: ColorManager.backgroundColor),
                    ProfileMenuItem(
                      title: context.loc.termsConditionsTitle,
                      onTap: () {
                        AppRouter.goTo(
                          screenName: ScreenName.termsConditionsScreen,
                        );
                      },
                    ),
                    const Divider(color: ColorManager.backgroundColor),
                    ProfileMenuItem(
                      title: context.loc.logout,
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