import 'package:car_ads/common/loading_overlay.dart';
import 'package:car_ads/common/primary_app_bar.dart';
import 'package:car_ads/common/primary_text_field.dart';
import 'package:car_ads/common/show_snack_bar.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/string_validation.dart';
import 'package:car_ads/features/add_ads/logic/provider/add_ads_provider.dart';
import 'package:car_ads/features/add_ads/view/widgets/add_ads_ad_type_selection.dart';
import 'package:car_ads/features/add_ads/view/widgets/add_ads_car_info.dart';
import 'package:car_ads/features/add_ads/view/widgets/add_ads_contact_info.dart';
import 'package:car_ads/features/add_ads/view/widgets/add_ads_description.dart';
import 'package:car_ads/features/add_ads/view/widgets/add_ads_image_picker.dart';
import 'package:car_ads/common/sticky_bottom_button.dart';
import 'package:car_ads/features/add_ads/view/widgets/add_ads_purpose_toggle.dart';
import 'package:car_ads/features/add_ads/view/widgets/add_ads_rental_section.dart';
import 'package:car_ads/features/explore/model/car_card_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../nav_button_bar/provider/nav_button_provider.dart';
import '../../../nav_button_bar/view/screens/nav_button_bar.dart';

class AddAdsScreen extends StatefulWidget {
  final CarCardModel? editingCar;
  const AddAdsScreen({super.key, this.editingCar});

  @override
  State<AddAdsScreen> createState() => _AddAdsScreenState();
}

class _AddAdsScreenState extends State<AddAdsScreen> {
  bool get isEditing => widget.editingCar != null;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String adPurpose = 'sale';
  String _rentalDurationType = 'days';
  DateTime? startDate;
  TimeOfDay? startTime;
  DateTime? endDate;
  TimeOfDay? endTime;

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
    if (isEditing && widget.editingCar != null) {
      final car = widget.editingCar!;
      adPurpose = car.purpose ?? 'sale';
      if (adPurpose == 'rent') {
        startDate = car.startDate != null ? DateTime.tryParse(car.startDate!) : null;
        startTime = car.startTime != null ? _parseTime(car.startTime!) : null;
        endDate = car.endDate != null ? DateTime.tryParse(car.endDate!) : null;
        endTime = car.endTime != null ? _parseTime(car.endTime!) : null;
      }
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final provider = context.read<AddAdsProvider>();
        if (isEditing) {
          provider.initEdit(context, widget.editingCar!);
        }
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

  TimeOfDay? _parseTime(String timeStr) {
    try {
      final parts = timeStr.split(':');
      if (parts.length == 2) {
        return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
      }
    } catch (e) {
      // Handle parsing error if needed
    }
    return null;
  }

  void _autoSelectDuration() {
    if (startDate != null && endDate != null) {
      final int diff = endDate!.difference(startDate!).inDays;
      if (diff < 7) {
        _rentalDurationType = 'days';
      } else if (diff < 30) {
        _rentalDurationType = 'weeks';
      } else {
        _rentalDurationType = 'months';
      }
    }
  }

  Future<void> _pickStartDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        startDate = picked;
        if (endDate != null) {
          _autoSelectDuration();
        }
      });
    }
  }

  Future<void> _pickStartTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: startTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => startTime = picked);
    }
  }

  Future<void> _pickEndDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: endDate ?? (startDate ?? DateTime.now()),
      firstDate: startDate ?? DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        endDate = picked;
        _autoSelectDuration();
      });
    }
  }

  Future<void> _pickEndTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: endTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => endTime = picked);
    }
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
      'purpose': adPurpose,
    };

    if (adPurpose == 'rent') {
      if (startDate == null || startTime == null || endDate == null || endTime == null) {
        showSnackBar(context, context.loc.fillRentalDatesError);
        return;
      }
      carDetails['startDate'] = startDate!.toIso8601String();
      carDetails['startTime'] = "${startTime!.hour}:${startTime!.minute}";
      carDetails['endDate'] = endDate!.toIso8601String();
      carDetails['endTime'] = "${endTime!.hour}:${endTime!.minute}";
    }

    try {
      final success = await provider.postAdvertisement(
        context: context,
        carDetails: carDetails,
      );

      if (success && mounted) {
        if (isEditing) {
          showSnackBar(context, context.loc.adUpdatedSuccess);
          Navigator.pop(context);
        } else {
          showSnackBar(context, context.loc.adPostedSuccess);

          context.read<NavButtonProvider>().onItemTapped(1);

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const NavButtonBar()),
                (Route<dynamic> route) => false,
          );
        }
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
                  ? context.loc.editAdTitle
                  : context.loc.postAdTitle,
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
                        AddAdsPurposeToggle(
                          adPurpose: adPurpose,
                          onChanged: (val) {
                            if (val != null) setState(() => adPurpose = val);
                          },
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
                        AddAdsRentalSection(
                          adPurpose: adPurpose,
                          rentalDurationType: _rentalDurationType,
                          startDate: startDate,
                          startTime: startTime,
                          endDate: endDate,
                          endTime: endTime,
                          onPickStartDate: _pickStartDate,
                          onPickStartTime: _pickStartTime,
                          onPickEndDate: _pickEndDate,
                          onPickEndTime: _pickEndTime,
                          onDurationChanged: (val) {
                            if (val != null) {
                              setState(() {
                                _rentalDurationType = val;
                              });
                            }
                          },
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
                          hint: context.loc.addPriceHint,
                          keyboardType: TextInputType.number,
                          validator: (val) => val == null || val.isEmpty
                              ? context.loc.priceEmptyError
                              : val.validateGeneric(context, context.loc.price),
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
                ],
              ),
            ),
          ),
          bottomNavigationBar: StickyBottomButton(
            text: isEditing ? context.loc.saveChanges : context.loc.postAd,
            onPressed: _submitAd,
            isLoading: provider.isLoading,
          ),
        );
      },
    );
  }
}