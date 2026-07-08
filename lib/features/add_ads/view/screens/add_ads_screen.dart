import 'package:car_ads/common/loading_overlay.dart';
import 'package:car_ads/common/primary_app_bar.dart';
import 'package:car_ads/common/primary_text_field.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/string_validation.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/features/add_ads/logic/provider/add_ads_provider.dart';
import 'package:car_ads/features/add_ads/view/widgets/add_ads_ad_type_selection.dart';
import 'package:car_ads/features/add_ads/view/widgets/add_ads_car_info.dart';
import 'package:car_ads/features/add_ads/view/widgets/add_ads_contact_info.dart';
import 'package:car_ads/features/add_ads/view/widgets/add_ads_description.dart';
import 'package:car_ads/features/add_ads/view/widgets/add_ads_image_picker.dart';
import 'package:car_ads/features/add_ads/view/widgets/add_ads_post_button.dart';
import 'package:car_ads/features/explore/model/car_card_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAdsScreen extends StatefulWidget {
  final CarCardModel? editingCar;
  const AddAdsScreen({super.key, this.editingCar});

  @override
  State<AddAdsScreen> createState() => _AddAdsScreenState();
}

class _AddAdsScreenState extends State<AddAdsScreen> {
  bool get isEditing => widget.editingCar != null;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<AddAdsProvider>();
      if (isEditing) {
        provider.initEdit(widget.editingCar!);
      } else {
        provider.clearForm();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddAdsProvider>(
      builder: (context, provider, _) {
        return PopScope(
          canPop: true,
          onPopInvokedWithResult: (didPop, result) {
            if (isEditing) provider.clearForm();
          },
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight + 16),
              child: PrimaryAppBar(
                text: isEditing
                    ? 'Edit Your Advertisement'
                    : 'Post Your Advertisement',
                backIconVisible: isEditing,
              ),
            ),
            body: LoadingOverlay(
              isLoading: provider.isLoading,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: [
                          Text(
                            'You can only display your cars for sale',
                            style: context.titleRegular18,
                          ),
                          context.addVerticalSpace(16),
                          AddAdsCarInfo(provider: provider),
                          context.addVerticalSpace(24),
                          AddAdsDescription(provider: provider),
                          context.addVerticalSpace(24),
                          AddAdsImagePicker(provider: provider),
                          context.addVerticalSpace(24),
                          PrimaryTextField(
                            controller: provider.priceController,
                            hint: 'Add Price',
                            keyboardType: TextInputType.number,
                            validator: (val) => val == null || val.isEmpty
                                ? 'Price cannot be empty'
                                : val.validateGeneric('Price'),
                          ),
                          context.addVerticalSpace(24),
                          AddAdsContactInfo(provider: provider),
                          context.addVerticalSpace(24),
                          AddAdsAdTypeSelection(provider: provider),
                        ],
                      ),
                    ),
                    AddAdsPostButton(provider: provider, formKey: _formKey),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
