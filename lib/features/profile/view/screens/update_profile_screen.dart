import 'package:car_ads/common/primary_app_bar.dart';
import 'package:car_ads/common/primary_button.dart';
import 'package:car_ads/common/primary_text_field.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/features/auth/logic/provider/auth_provider.dart';
import 'package:car_ads/features/profile/logic/provider/update_profile_provider.dart';
import 'package:car_ads/features/profile/view/widgets/update_profile_image_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: PrimaryAppBar(
            backIconVisible: true,
            text: 'Update Your Profile',
          ),
        ),

        body: Consumer2<AuthProvider, UpdateProfileProvider>(
          builder: (context, authProvider, updateProvider, _) {
            return Stack(
              children: [
                Form(
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
                                label: 'Full Name',
                                isBorderVisible: false,
                                controller: updateProvider.nameController,
                                hint: 'Enter your name',
                                validator: (val) => val?.isEmpty ?? true
                                    ? 'Please enter your name'
                                    : null,
                              ),
                            ),
                          ],
                        ).padSymmetric(20),
                      ),
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(
                              color: Color(0xFFE0E0E0),
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: PrimaryButton(
                          text: 'Save Changes',
                          onPressed: authProvider.state.isLoading
                              ? null
                              : () => updateProvider.handleUpdate(context),
                        ),
                      ),
                    ],
                  ),
                ),
                if (authProvider.state.isLoading)
                  const Center(child: CircularProgressIndicator()),
              ],
            );
          },
        ),
      ),
    );
  }
}
