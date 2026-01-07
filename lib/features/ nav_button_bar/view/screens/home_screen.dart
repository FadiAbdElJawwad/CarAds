import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/routes/app_router.dart';
import 'package:car_ads/routes/screen_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import '../../../auth/view/widgets/slider_indicator.dart';
import '../../model/home_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;
  int _currentPage = 0;
  late List<HomeModel> homeData;

  final FlutterSecureStorage storage = const FlutterSecureStorage();
  String? name;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadName();
    _pageController = PageController(viewportFraction: 0.9);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homeData = homeList(context);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadName() async {
    final storedName = await storage.read(key: 'name');
    if (mounted) {
      setState(() {
        name = storedName;
        isLoading = false;
      });
    }
  }

  Future<void> _handleLogout() async {
    await storage.deleteAll();
    if (mounted) {
      AppRouter.goToAndRemove(screenName: ScreenName.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Welcome ${name ?? 'User'}',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Card(
                      child: IconButton(
                        onPressed: _handleLogout, // Use the new logout method
                        icon: SvgPicture.asset(ImagesManager.notification),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 300,
                child: PageView.builder(
                  onPageChanged: (int currentPage) {
                    setState(() {
                      _currentPage = currentPage;
                    });
                  },
                  controller: _pageController,
                  itemCount: homeData.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  homeData[i].image!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    homeData[i].model!,
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        homeData[i].price!.toString(),
                                        style: Theme.of(context).textTheme.titleMedium,
                                      ),
                                      Text(
                                        'AED',
                                        style: Theme.of(context).textTheme.titleSmall,
                                      ),
                                      Text(
                                        homeData[i].rent!,
                                        style: Theme.of(context).textTheme.titleSmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(ImagesManager.gear),
                                    Text(
                                      homeData[i].gear!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.grey),
                                    ),
                                    const VerticalDivider(color: Colors.grey, thickness: 1),
                                    SvgPicture.asset(ImagesManager.seats),
                                    Text(
                                      homeData[i].seats!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.grey),
                                    ),
                                    const VerticalDivider(color: Colors.grey, thickness: 1),
                                    SvgPicture.asset(ImagesManager.fuel),
                                    Text(
                                      homeData[i].fuel!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(homeData.length, (index) {
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
            ],
          ),
        ),
      ),
    );
  }
}
