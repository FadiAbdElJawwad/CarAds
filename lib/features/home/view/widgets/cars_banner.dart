import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constant/images_manager.dart';
import '../../../../core/extension/app_sizes.dart';
import '../../../auth/view/widgets/slider_indicator.dart';
import '../../model/cars_banner_model.dart';

class CarsBanner extends StatefulWidget {
  const CarsBanner({super.key});

  @override
  State<CarsBanner> createState() => _CarsBannerState();
}

class _CarsBannerState extends State<CarsBanner> {

  late final PageController _pageController;
  int _currentPage = 0;
  late List<CarsBannerModel> carsBannerData;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    carsBannerData = carsBannerList(context);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height(300),
      child: InkWell(
        onTap: () {
          AppRouter.goTo(screenName: ScreenName.carAdsScreen);
        },
        // onTap: () {
        //   final selectedCar = carsBannerData[_currentPage];
        //   AppRouter.goTo(
        //     screenName: ScreenName.carDetailsForm,
        //     arguments: selectedCar,
        //   );
        //   // AppRouter.goTo(screenName: ScreenName.carDetailsForm);
        // },
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
                    itemCount: carsBannerData.length,
                    itemBuilder: (context, i) {
                      return Image.asset(
                        carsBannerData[i].image!,
                        fit: BoxFit.contain,
                      );
                    }
                ),
              ),
              context.addVerticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween,
                children: [
                  Text(
                    carsBannerData[_currentPage].model!,
                    style: context.titleBold18,
                  ),
                  Row(
                    children: [
                      Text(
                        carsBannerData[_currentPage].price!.toString(),
                        style: context.inputBold16,
                      ),
                      Text(
                        'AED',
                        style: context.inputRegular16,
                      ),
                      Text(
                        carsBannerData[_currentPage].rent!,
                        style: context.inputRegular16,

                      ),
                    ],
                  ),
                ],
              ),
              context.addVerticalSpace(8),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween,
                  children: [
                    SvgPicture.asset(ImagesManager.gear),
                    Text(
                      carsBannerData[_currentPage].gear!,
                      style: context.inputRegular14.copyWith(
                          color: Colors.grey),
                    ),
                    const VerticalDivider(
                        color: Colors.grey, thickness: 1),
                    SvgPicture.asset(ImagesManager.seats),
                    Text(
                      '${carsBannerData[_currentPage].seats!} seats',
                      style: context.inputRegular14.copyWith(
                          color: Colors.grey),
                    ),
                    const VerticalDivider(
                        color: Colors.grey, thickness: 1),
                    SvgPicture.asset(ImagesManager.fuel),
                    Text(
                      carsBannerData[_currentPage].fuelType!,
                      style: context.inputRegular14.copyWith(
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              context.addVerticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(carsBannerData.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 2),
                    child: SliderIndicator(
                      selected: _currentPage == index,
                      currentPage: index,
                    ),
                  );
                }
                ),
              ),
            ],
          ).pad(20),
        ),
      ),
    );
  }
}
