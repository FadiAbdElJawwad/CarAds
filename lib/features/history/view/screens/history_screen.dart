import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/features/auth/logic/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/primary_app_bar.dart';
import '../../logic/provider/history_provider.dart';
import '../widgets/clear_history_confirmation.dart';
import '../widgets/history_card.dart';
import '../widgets/history_card_skeleton.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer2<AuthProvider, HistoryProvider>(
      builder: (context, authProvider, model, child) {
        final userId = authProvider.state.user?.uid;
        if (userId != null) {
          model.init(userId);
        }

        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: PrimaryAppBar(text: 'History'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => ClearHistoryConfirmation.show(
                  context,
                  onConfirm: model.clearHistory,
                ),
                child: Text(
                  'Clear ALL',
                  style: context.bodyRegular.copyWith(color: Colors.grey),
                ),
              ),
              Expanded(
                child: model.isLoading
                    ? ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const HistoryCardSkeleton();
                        },
                      )
                    : model.orders.isEmpty
                    ? const Center(child: Text('No history yet.'))
                    : ListView.builder(
                        itemCount: model.orders.length,
                        itemBuilder: (context, index) {
                          return HistoryCard(order: model.orders[index]);
                        },
                      ),
              ),
            ],
          ).padSymmetric(20),
        );
      },
    );
  }
}
