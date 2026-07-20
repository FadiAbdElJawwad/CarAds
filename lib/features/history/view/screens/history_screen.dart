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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);

      if (authProvider.state.user == null) {
        await authProvider.checkLoginStatus();
      }

      final userId = authProvider.state.user?.uid;

      if (userId != null) {
        if (mounted) {
          Provider.of<HistoryProvider>(context, listen: false).init(userId);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final userId = context.watch<AuthProvider>().state.user?.uid;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: PrimaryAppBar(text: context.loc.history),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => ClearHistoryConfirmation.show(
              context,
              onConfirm: () => context.read<HistoryProvider>().clearHistory(),
            ),
            child: Text(
              context.loc.clearAll,
              style: context.bodyRegular.copyWith(color: Colors.grey),
            ),
          ),
          Expanded(
            child: userId == null
                ? Center(child: Text(context.loc.loginRequired))
                : Consumer<HistoryProvider>(
              builder: (context, model, child) {
                if (model.isLoading) {
                  return ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) =>
                    const HistoryCardSkeleton(),
                  );
                }

                if (model.orders.isEmpty) {
                  return Center(child: Text(context.loc.noHistoryYet));
                }

                return ListView.builder(
                  itemCount: model.orders.length,
                  itemBuilder: (context, index) {
                    return HistoryCard(order: model.orders[index]);
                  },
                );
              },
            ),
          ),
        ],
      ).padSymmetric(20),
    );
  }
}