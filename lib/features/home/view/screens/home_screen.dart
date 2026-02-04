import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/extension/app_sizes.dart';
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
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + MediaQuery
            .of(context)
            .padding
            .top),
        child: FutureBuilder<DocumentSnapshot?>(
          future: authProvider.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const PrimaryAppBar(
                text: 'Welcome',
                notificationVisible: true,
              );
            }
            if (snapshot.hasError || !snapshot.hasData ||
                snapshot.data?.data() == null) {
              return const PrimaryAppBar(
                text: 'Welcome',
                notificationVisible: true,
              );
            }
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            final String userName = userData['name'] ?? 'User';
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
            Text(
              'Top rated Showroom ',
              style: context.titleRegular18,
            ),
            context.addVerticalSpace(8),
            const TopRatedShowroom(),
          ],
        ).padSymmetric(20),

      ),
    );
  }
}
