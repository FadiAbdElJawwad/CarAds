import 'package:car_ads/common/skeleton.dart';
import 'package:car_ads/common/network_custom_image_widget.dart';
import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/features/explore/logic/provider/car_ads_provider.dart';
import 'package:car_ads/features/showroom/view/widgets/showroom_ad_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../common/primary_app_bar.dart';
import '../../../../core/extension/app_sizes.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/routes/screen_name.dart';
import '../../../auth/logic/provider/auth_provider.dart';
import '../../../profile/view/widgets/profile_header_card.dart';

class ShowroomProfileScreen extends StatefulWidget {
  const ShowroomProfileScreen({super.key});

  @override
  State<ShowroomProfileScreen> createState() => _ShowroomProfileScreenState();
}

class _ShowroomProfileScreenState extends State<ShowroomProfileScreen> {
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
        child: PrimaryAppBar(text: 'Your Profile', settingsVisible: true),
      ),
      body: Consumer2<AuthProvider, CarAdsProvider>(
        builder: (context, authProvider, carAdsProvider, child) {
          final user = authProvider.state.user;
          final myCars = carAdsProvider.availableCars
              .where((car) => car.showroomId == user?.uid)
              .toList();

          return ListView(
            shrinkWrap: true,
            children: [
              ProfileHeaderCard(
                name: user?.name ?? 'Loading...',
                phone: user?.phone ?? user?.email ?? '',
                profileImage: user?.profileImage,
              ),

              context.addVerticalSpace(16),
              Text('Manage your Ads!', style: context.bodyRegular),
              context.addVerticalSpace(8),
              if (carAdsProvider.isLoading)
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  separatorBuilder: (context, index) =>
                      context.addVerticalSpace(16),
                  itemBuilder: (context, index) => Card(
                    child: Column(
                      children: [
                        const Skeleton(height: 100, width: double.infinity),
                        context.addVerticalSpace(10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Skeleton(width: 120, height: 18),
                            Skeleton(width: 80, height: 18),
                          ],
                        ),
                        context.addVerticalSpace(8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Skeleton(width: 60, height: 14),
                            Skeleton(width: 60, height: 14),
                            Skeleton(width: 60, height: 14),
                          ],
                        ),
                      ],
                    ).pad(20),
                  ),
                )
              else if (myCars.isEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'No ads posted yet.',
                      style: context.bodyRegular.copyWith(color: Colors.grey),
                    ),
                  ),
                )
              else
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: myCars.length,
                  separatorBuilder: (context, index) =>
                      context.addVerticalSpace(16),
                  itemBuilder: (context, index) {
                    final car = myCars[index];
                    return InkWell(
                      onTap: () {
                        AppRouter.goTo(
                          screenName: ScreenName.carDetailsForm,
                          arguments: car,
                        );
                      },
                      child: Card(
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                NetworkCustomImageWidget(
                                  imageUrl: car.carImage ?? '',
                                  height: 100,
                                  fit: BoxFit.contain,
                                ),
                                context.addVerticalSpace(10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      car.carName ?? 'N/A',
                                      style: context.titleBold18,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${car.price != null ? (int.tryParse(car.price!) ?? 0) : 0} K',
                                          style: context.inputBold16,
                                        ),
                                        Text(
                                          ' AED',
                                          style: context.inputRegular16,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                context.addVerticalSpace(8),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(ImagesManager.gear),
                                      Text(
                                        car.gearType ?? 'N/A',
                                        style: context.inputRegular14.copyWith(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const VerticalDivider(
                                        color: Colors.grey,
                                        thickness: 1,
                                      ),
                                      SvgPicture.asset(ImagesManager.seats),
                                      Text(
                                        '${car.seats ?? 'N/A'} seats',
                                        style: context.inputRegular14.copyWith(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const VerticalDivider(
                                        color: Colors.grey,
                                        thickness: 1,
                                      ),
                                      SvgPicture.asset(ImagesManager.fuel),
                                      Text(
                                        car.fuel ?? 'N/A',
                                        style: context.inputRegular14.copyWith(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            ShowroomAdActions(car: car, userId: user?.uid),
                          ],
                        ).pad(20),
                      ),
                    );
                  },
                ),
            ],
          );
        },
      ),
    ).padSymmetric(20);
  }
}
