import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/primary_app_bar.dart';
import '../../../auth/logic/provider/auth_provider.dart';

class ShowroomMainScreen extends StatefulWidget {
  const ShowroomMainScreen({super.key});

  @override
  State<ShowroomMainScreen> createState() => _ShowroomMainScreenState();
}

class _ShowroomMainScreenState extends State<ShowroomMainScreen> {
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
    );
  }
}
