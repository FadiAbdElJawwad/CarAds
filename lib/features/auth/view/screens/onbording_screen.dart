import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../../common/primary_button.dart';
import '../../../../core/extension/responsive_layout_extension.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/routes/screen_name.dart';
import '../../model/onbording_model.dart';
import '../widgets/slider_indicator.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});
  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  late List<OnbordingModel> onbordingData;
  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    onbordingData = onbordingList(context);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _completeOnboarding() async {
    await storage.write(key: 'onboarding', value: 'true');
    if (mounted) {
      AppRouter.goToAndRemove(screenName: ScreenName.login);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2,),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: SizedBox(
                    width: double.infinity,
                    child: PageView.builder(
                        onPageChanged: (int currentPage) {
                          setState(() {
                            _currentPage = currentPage;
                          });
                        },
                        controller: _pageController,
                        itemCount: onbordingData.length,
                        itemBuilder: (context, i) {
                          return Image.asset(
                            onbordingData[i].image!,
                          );
                        }),
                  ),
                )
            ),
            context.addVerticalSpace(20),
            Text(
                onbordingData[_currentPage].title!,
                textAlign: TextAlign.center,
                style: context.h2Bold22),
            context.addVerticalSpace(24),
            Text(
                onbordingData[_currentPage].body!,
                textAlign: TextAlign.center,
                style: context.bodyRegular
            ),
            const Spacer(flex: 1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(onbordingData.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: SliderIndicator(
                    selected: _currentPage == index,
                    currentPage: index,
                  ),
                );
              }
              ),
            ),
            context.addVerticalSpace(50),
            PrimaryButton(
              text: _currentPage == 2 ? context.loc
                  .userJoin : context.loc
                  .next,
              onPressed: () {
                if (_currentPage == 2) {
                  _completeOnboarding();
                } else {
                  _pageController.animateToPage(
                    _currentPage + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
            const SizedBox(height: 16,),
            Visibility(
                visible: _currentPage == 2,
                child: PrimaryButton(
                    text: context.loc
                        .showroomsJoin,
                    onPressed: _completeOnboarding
                )
            ),
            TextButton(
                onPressed: _completeOnboarding,
                child: Text(context.loc
                    .skip,
                    style: Theme.of(context).textTheme.bodyMedium
                )),
            context.addVerticalSpace(40),
          ],
        ).padSymmetric(20)
    );
  }
}
