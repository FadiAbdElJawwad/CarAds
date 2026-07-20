import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/primary_app_bar.dart';
import '../../../auth/logic/provider/auth_provider.dart';
import '../../logic/provider/showroom_provider.dart';
import '../../model/rent_request_model.dart';
import '../widgets/showroom_request_card_widget.dart';
import '../widgets/showroom_request_skeleton.dart';

class RequestsScreen extends StatelessWidget {
  final bool showBackIcon;
  const RequestsScreen({super.key, this.showBackIcon = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: PrimaryAppBar(
          backIconVisible: showBackIcon,
          text: context.loc.requests,
        ),
      ),
      body: ListView(
        children: [
          Consumer2<AuthProvider, ShowroomProvider>(
            builder: (context, authProvider, showroomProvider, child) {
              final showroomId = authProvider.state.user?.uid;
              if (showroomId == null) {
                return Center(
                  child: Text(context.loc.loginAsShowroomError),
                );
              }

              return StreamBuilder<List<RentRequestModel>>(
                stream: showroomProvider.getRecentRentRequests(
                  showroomId,
                  limit: null,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      children: List.generate(
                        5,
                            (index) => const ShowroomRequestSkeleton(),
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(context.loc.errorWithDetails(snapshot.error.toString())),
                    );
                  }

                  final requests = snapshot.data ?? [];

                  if (requests.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(context.loc.noRentRequestsYet),
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
    );
  }
}