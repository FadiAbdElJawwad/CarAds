import 'package:flutter/material.dart';
import '../../../../common/primary_button.dart';
import '../../../../routes/app_router.dart';
import '../../../../routes/screen_name.dart';
import '../model/onbording_model.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});
  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  late bool selected;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
@override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
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
                          itemCount: onbordingList.length,
                          itemBuilder: (context, i) {
                            return Image.asset(
                              onbordingList[i].image!,
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
                onbordingList[_currentPage].title!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 24,),
              Text(
                onbordingList[_currentPage].body!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black
                ),
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

                text: _currentPage == 2 ? 'Join Now As A User' : 'Next',
                onPressed: () {
                  _currentPage == 2 ? AppRouter.goToAndRemove(
                      screenName: ScreenName.login) :
                  _pageController.animateToPage(
                    _currentPage + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              SizedBox(height: 16,),
              Visibility(
                  visible: _currentPage == 2,
                  child: PrimaryButton(

                      text: 'Join Now As A Showrooms',
                      onPressed: () {
                        AppRouter.goToAndRemove(screenName: ScreenName.login);
                      }
                  )

              ),
              TextButton(
                  onPressed: () {
                    AppRouter.goToAndRemove(screenName: ScreenName.login);
                  },
                  child: const Text('Skip',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black
                    ),
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

class SliderIndicator extends StatelessWidget {
  final bool selected;
  final int currentPage;

  const SliderIndicator(
      {super.key, required this.selected, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 9,
      width: selected ? 35 : 9,
      decoration: BoxDecoration(
          color: selected
              ? Colors.black
              : Colors.grey,
          borderRadius: BorderRadius.circular(25)
      ),
    );
  }
}

