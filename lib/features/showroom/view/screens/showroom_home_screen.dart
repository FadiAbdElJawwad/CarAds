import 'package:car_ads/common/skeleton.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/features/showroom/model/rent_request_model.dart';
import 'package:car_ads/features/showroom/logic/provider/showroom_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/primary_app_bar.dart';
import '../../../auth/logic/provider/auth_provider.dart';
import '../widgets/profit_card_widget.dart';
import '../widgets/section_header_widget.dart';
import '../widgets/showroom_request_card_widget.dart';
import '../widgets/showroom_request_skeleton.dart';

class ShowroomHomeScreen extends StatefulWidget {
  const ShowroomHomeScreen({super.key});

  @override
  State<ShowroomHomeScreen> createState() => _ShowroomHomeScreenState();
}

class _ShowroomHomeScreenState extends State<ShowroomHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final showroomId = context.read<AuthProvider>().state.user?.uid;
      if (showroomId != null) {
        context.read<ShowroomProvider>().fetchProfitMetrics(showroomId);
      }
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<ShowroomProvider>(
                builder: (context, showroomProvider, _) {
                  if (showroomProvider.isLoading &&
                      showroomProvider.rentProfit == 0) {
                    return Row(
                      children: [
                        Expanded(
                          child: const Skeleton(height: 100, radius: 16),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: const Skeleton(height: 100, radius: 16),
                        ),
                      ],
                    );
                  }
                  return Row(
                    children: [
                      ProfitCardWidget(
                        title: 'Sales profit',
                        amount:
                            '\$${showroomProvider.salesProfit.toStringAsFixed(0)}',
                        percentage: '0.0',
                        isPositive: true,
                        backgroundColor: const Color(0xFF1A1D1E),
                        textColor: Colors.white,
                      ),
                      const SizedBox(width: 16),
                      ProfitCardWidget(
                        title: 'Rent profit',
                        amount:
                            '\$${showroomProvider.rentProfit.toStringAsFixed(0)}',
                        percentage: '0.0',
                        isPositive: true,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                      ),
                    ],
                  );
                },
              ),
              context.addVerticalSpace(30),
              SectionHeaderWidget(
                title: 'Last 5 Rent Request',
                onSeeAll: () {
                  AppRouter.goTo(
                    screenName: ScreenName.requestsScreen,
                    arguments: true,
                  );
                },
              ),

              Consumer2<AuthProvider, ShowroomProvider>(
                builder: (context, authProvider, showroomProvider, child) {
                  final showroomId = authProvider.state.user?.uid;
                  if (showroomId == null) {
                    return const Center(
                      child: Text('Please log in as a showroom.'),
                    );
                  }

                  return StreamBuilder<List<RentRequestModel>>(
                    stream: showroomProvider.getRecentRentRequests(showroomId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Column(
                          children: List.generate(
                            3,
                            (index) => const ShowroomRequestSkeleton(),
                          ),
                        );
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      final requests = snapshot.data ?? [];

                      if (requests.isEmpty) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text('No rent requests yet.'),
                          ),
                        );
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: requests.length,
                        itemBuilder: (context, index) {
                          final request = requests[index];
                          return ShowroomRequestCardWidget(request: request);
                        },
                      );
                    },
                  );
                },
              ),
              context.addVerticalSpace(20),
            ],
          ).padSymmetric(20),
        ),
      ),
    );
  }
}
