import 'package:car_ads/features/explore/logic/provider/car_ads_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../common/skeleton.dart';
import '../../../../core/constant/images_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import '../../../../core/extension/text_style_extension.dart';
import '../../../auth/view/widgets/slider_indicator.dart';
import '../../../../common/car_image_extractor.dart';
import 'package:car_ads/features/explore/model/car_card_model.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/routes/screen_name.dart';

class CarsBanner extends StatefulWidget {
  const CarsBanner({super.key});

  @override
  State<CarsBanner> createState() => _CarsBannerState();
}

class _CarsBannerState extends State<CarsBanner> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CarAdsProvider>().fetchAvailableCars();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<CarCardModel> _filterOnePerType(BuildContext context, List<CarCardModel> allCars) {
    final Map<String, CarCardModel> uniqueCars = {};
    for (var car in allCars) {
      final type = car.carName ?? context.loc.unknown;
      if (!uniqueCars.containsKey(type)) {
        uniqueCars[type] = car;
      }
    }
    return uniqueCars.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight(300),
      child: Consumer<CarAdsProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const _CarsBannerSkeleton();
          }

          if (provider.errorMessage != null) {
            return const SizedBox();
          }

          final allCars = provider.availableCars;

          if (allCars.isEmpty) {
            return const SizedBox();
          }

          final cars = _filterOnePerType(context, allCars);
          cars.sort((a, b) => (a.carName ?? '').compareTo(b.carName ?? ''));

          if (cars.isEmpty) return const SizedBox();

          final safeIndex = _currentPage >= cars.length ? 0 : _currentPage;
          final currentCar = cars[safeIndex];

          return InkWell(
            onTap: () {
              AppRouter.goTo(
                screenName: ScreenName.carDetailsForm,
                arguments: currentCar,
              );
            },
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      onPageChanged: (int currentPage) {
                        setState(() {
                          _currentPage = currentPage;
                        });
                      },
                      controller: _pageController,
                      itemCount: cars.length,
                      itemBuilder: (context, i) {
                        return CarImageExtractor.buildImage(
                          cars[i].carImage,
                          height: context.screenHeight(200),
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),
                  context.addVerticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        currentCar.carName ?? context.loc.notAvailable,
                        style: context.titleBold18,
                      ),
                      Row(
                        children: [
                          Text(
                            '${currentCar.price}${context.loc.thousandSuffix}',
                            style: context.inputBold16,
                          ),
                          Text(
                            currentCar.purpose == 'rent' ? ' ${context.loc.aedPerDay}' : ' ${context.loc.aed}',
                            style: context.inputRegular16,
                          ),
                        ],
                      ),
                    ],
                  ),
                  context.addVerticalSpace(8),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(ImagesManager.gear),
                        Text(
                          currentCar.gearType ?? context.loc.notAvailable,
                          style: context.inputRegular14.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        const VerticalDivider(color: Colors.grey, thickness: 1),
                        SvgPicture.asset(ImagesManager.seats),
                        Text(
                          context.loc.seatsCount(currentCar.seats ?? '0'),
                          style: context.inputRegular14.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        const VerticalDivider(color: Colors.grey, thickness: 1),
                        SvgPicture.asset(ImagesManager.fuel),
                        Text(
                          currentCar.fuel ?? context.loc.notAvailable,
                          style: context.inputRegular14.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  context.addVerticalSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(cars.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: SliderIndicator(
                          selected: safeIndex == index,
                          currentPage: index,
                        ),
                      );
                    }),
                  ),
                ],
              ).pad(20),
            ),
          );
        },
      ),
    );
  }
}

class _CarsBannerSkeleton extends StatelessWidget {
  const _CarsBannerSkeleton();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const Expanded(child: Skeleton(width: double.infinity)),
          context.addVerticalSpace(10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Skeleton(width: 120, height: 24),
              Skeleton(width: 80, height: 24),
            ],
          ),
          context.addVerticalSpace(8),
          const IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Skeleton(width: 24, height: 24, radius: 12),
                Skeleton(width: 60, height: 18),
                VerticalDivider(color: Colors.grey, thickness: 1),
                Skeleton(width: 24, height: 24, radius: 12),
                Skeleton(width: 60, height: 18),
                VerticalDivider(color: Colors.grey, thickness: 1),
                Skeleton(width: 24, height: 24, radius: 12),
                Skeleton(width: 60, height: 18),
              ],
            ),
          ),
          context.addVerticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: Skeleton(width: 8, height: 8, radius: 4),
              );
            }),
          ),
        ],
      ).pad(20),
    );
  }
}