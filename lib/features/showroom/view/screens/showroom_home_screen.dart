import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/features/showroom/model/rent_request_model.dart';
import 'package:car_ads/features/showroom/logic/provider/showroom_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/primary_app_bar.dart';
import '../../../auth/logic/provider/auth_provider.dart';
import '../widgets/profit_card_widget.dart';
import '../widgets/section_header_widget.dart';
import '../widgets/showroom_request_card_widget.dart';

class ShowroomHomeScreen extends StatelessWidget {
  const ShowroomHomeScreen({super.key});

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
              const Row(
                children: [
                  ProfitCardWidget(
                    title: 'Sales profit',
                    amount: '\$152,000',
                    percentage: '12.5',
                    isPositive: true,
                    backgroundColor: Color(0xFF1A1D1E),
                    textColor: Colors.white,
                  ),
                  SizedBox(width: 16),
                  ProfitCardWidget(
                    title: 'Rent profit',
                    amount: '\$45,000',
                    percentage: '8.2',
                    isPositive: false,
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                  ),
                ],
              ),

              context.addVerticalSpace(30),
              SectionHeaderWidget(
                title: 'Last 5 Rent Request',
                onSeeAll: () {
                  // TODO: Implement See All navigation
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
                        return const Center(child: CircularProgressIndicator());
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
