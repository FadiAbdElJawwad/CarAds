import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../../common/primary_button.dart';
import '../../../../../routes/app_router.dart';
import '../../../../../routes/screen_name.dart';
import '../../../../generated/l10n.dart';
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
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
                              width: 167,
                            );
                          }),
                    ),
                  )
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                  onbordingData[_currentPage].title!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 24,),
              Text(
                  onbordingData[_currentPage].body!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium
              ),
              const Spacer(flex: 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SliderIndicator(selected: _currentPage == 0, currentPage: 0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: SliderIndicator(
                      selected: _currentPage == 1, currentPage: 1,),
                  ),
                  SliderIndicator(selected: _currentPage == 2, currentPage: 2,),

                ],
              ),
              const SizedBox(height: 50,),
              PrimaryButton(
                text: _currentPage == 2 ? S
                    .of(context)
                    .userJoin : S
                    .of(context)
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
                      text: S
                          .of(context)
                          .showroomsJoin,
                      onPressed: _completeOnboarding
                  )
              ),
              TextButton(
                  onPressed: _completeOnboarding,
                  child: Text(S
                      .of(context)
                      .skip,
                      style: Theme.of(context).textTheme.bodyMedium
                  )),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        )
    );
  }
}
