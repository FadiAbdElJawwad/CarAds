import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import '../../../auth/logic/provider/auth_provider.dart';
import '../widgets/cars_banner.dart';
import '../../../../common/primary_app_bar.dart';
import '../widgets/top_rated_showroom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          kToolbarHeight + (MediaQuery.of(context).padding.top),
        ),
        child: Consumer<AuthProvider>(
          builder: (context, authProvider, child) {
            final user = authProvider.state.user;
            final String userName = user?.name ?? 'User';
            return PrimaryAppBar(
              text: 'Welcome $userName',
              notificationVisible: true,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CarsBanner(),
            context.addVerticalSpace(26),
            const TopRatedShowroom(),
          ],
        ).padSymmetric(20),
      ),
    );
  }
}
