import 'package:car_ads/common/loading_overlay.dart';
import 'package:car_ads/common/primary_app_bar.dart';
import 'package:car_ads/common/primary_text_field.dart';
import 'package:car_ads/common/show_snack_bar.dart';
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

  late final TextEditingController brandController;
  late final TextEditingController modelController;
  late final TextEditingController yearController;
  late final TextEditingController mileageController;
  late final TextEditingController conditionController;
  late final TextEditingController tankSizeController;
  late final TextEditingController gearBoxController;
  late final TextEditingController seatsController;
  late final TextEditingController doorsController;
  late final TextEditingController descriptionController;
  late final TextEditingController priceController;
  late final TextEditingController nameController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    _initControllers();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<AddAdsProvider>();
      if (isEditing) {
        provider.initEdit(widget.editingCar!);
      }
    });
  }

  void _initControllers() {
    final car = widget.editingCar;
    brandController = TextEditingController(text: car?.carName ?? '');
    modelController = TextEditingController(text: car?.carModel ?? '');
    yearController = TextEditingController(text: car?.year ?? '');
    mileageController = TextEditingController(text: car?.mileage ?? '');
    seatsController = TextEditingController(text: car?.seats ?? '');
    doorsController = TextEditingController(text: car?.doors ?? '');
    descriptionController = TextEditingController(text: car?.description ?? '');
    priceController = TextEditingController(text: car?.price ?? '');
    nameController = TextEditingController(text: car?.contactName ?? '');
    phoneController = TextEditingController(text: car?.contactPhone ?? '');
    tankSizeController = TextEditingController(text: car?.fuel ?? '');

    conditionController = TextEditingController(
      text: car?.condition?.isNotEmpty == true
          ? _capitalizeFirstLetter(car!.condition!)
          : '',
    );

    gearBoxController = TextEditingController(
      text: car?.gearType?.isNotEmpty == true
          ? _capitalizeFirstLetter(car!.gearType!)
          : '',
    );
  }

  String _capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return "${text[0].toUpperCase()}${text.substring(1)}";
  }

  @override
  void dispose() {
    brandController.dispose();
    modelController.dispose();
    yearController.dispose();
    mileageController.dispose();
    conditionController.dispose();
    tankSizeController.dispose();
    gearBoxController.dispose();
    seatsController.dispose();
    doorsController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _submitAd() async {
    if (!_formKey.currentState!.validate()) return;

    final provider = context.read<AddAdsProvider>();
    final carDetails = {
      'brand': brandController.text.trim(),
      'model': modelController.text.trim(),
      'year': yearController.text.trim(),
      'mileage': mileageController.text.trim(),
      'condition': conditionController.text.trim(),
      'tankSize': tankSizeController.text.trim(),
      'gearType': gearBoxController.text.trim(),
      'description': descriptionController.text.trim(),
      'price': priceController.text.trim(),
      'name': nameController.text.trim(),
      'phone': phoneController.text.trim(),
      'seats': seatsController.text.trim(),
      'doors': doorsController.text.trim(),
    };

    try {
      final success = await provider.postAdvertisement(
        context: context,
        carDetails: carDetails,
      );
      if (success && mounted) {
        showSnackBar(
          context,
          isEditing
              ? 'Advertisement updated successfully!'
              : 'Advertisement posted successfully!',
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        showSnackBar(context, e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddAdsProvider>(
      builder: (context, provider, _) {
        return Scaffold(
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
                        AddAdsCarInfo(
                          brandController: brandController,
                          modelController: modelController,
                          yearController: yearController,
                          conditionController: conditionController,
                          tankSizeController: tankSizeController,
                          gearBoxController: gearBoxController,
                          seatsController: seatsController,
                          doorsController: doorsController,
                          mileageController: mileageController,
                        ),
                        context.addVerticalSpace(24),
                        AddAdsDescription(
                          descriptionController: descriptionController,
                        ),
                        context.addVerticalSpace(24),
                        AddAdsImagePicker(provider: provider),
                        context.addVerticalSpace(24),
                        PrimaryTextField(
                          controller: priceController,
                          hint: 'Add Price',
                          keyboardType: TextInputType.number,
                          validator: (val) => val == null || val.isEmpty
                              ? 'Price cannot be empty'
                              : val.validateGeneric('Price'),
                        ),
                        context.addVerticalSpace(24),
                        AddAdsContactInfo(
                          nameController: nameController,
                          phoneController: phoneController,
                        ),
                        context.addVerticalSpace(24),
                        AddAdsAdTypeSelection(provider: provider),
                      ],
                    ),
                  ),
                  AddAdsPostButton(
                    isLoading: provider.isLoading,
                    isEditing: isEditing,
                    onPressed: _submitAd,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
