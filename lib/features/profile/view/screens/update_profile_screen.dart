import 'package:car_ads/common/primary_app_bar.dart';
import 'package:car_ads/common/sticky_bottom_button.dart';
import 'package:car_ads/common/primary_text_field.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/features/auth/logic/provider/auth_provider.dart';
import 'package:car_ads/features/profile/logic/provider/update_profile_provider.dart';
import 'package:car_ads/features/profile/view/widgets/update_profile_image_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/loading_overlay.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  late final UpdateProfileProvider _updateProfileProvider;

  @override
  void initState() {
    super.initState();
    _updateProfileProvider = UpdateProfileProvider();
    final user = context.read<AuthProvider>().state.user;
    _updateProfileProvider.init(user?.name);
  }

  @override
  void dispose() {
    _updateProfileProvider.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _updateProfileProvider,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: PrimaryAppBar(
            backIconVisible: true,
            text: context.loc.updateProfileTitle,
          ),
        ),
        body: Consumer2<AuthProvider, UpdateProfileProvider>(
          builder: (context, authProvider, updateProvider, _) {
            return LoadingOverlay(
              isLoading: authProvider.state.isLoading,
              child: Form(
                key: updateProvider.formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          UpdateProfileImageSection(
                            imageFile: updateProvider.imageFile,
                            profileImageUrl:
                            authProvider.state.user?.profileImage,
                            onPickImage: () {
                              updateProvider.pickImage();
                            },
                          ),
                          context.addVerticalSpace(24),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFFE0E0E0),
                              ),
                            ),
                            child: PrimaryTextField(
                              label: context.loc.fullNameLabel,
                              isBorderVisible: false,
                              controller: updateProvider.nameController,
                              hint: context.loc.enterNameHint,
                              validator: (val) => val?.isEmpty ?? true
                                  ? context.loc.enterNameError
                                  : null,
                            ),
                          ),
                        ],
                      ).padSymmetric(20),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Consumer2<AuthProvider, UpdateProfileProvider>(
          builder: (context, authProvider, updateProvider, _) {
            return StickyBottomButton(
              text: context.loc.saveChanges,
              onPressed: authProvider.state.isLoading
                  ? null
                  : () => updateProvider.handleUpdate(context),
              isLoading: authProvider.state.isLoading,
            );
          },
        ),
      ),
    );
  }
}