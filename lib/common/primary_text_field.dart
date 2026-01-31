import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import '../core/constant/color_manager.dart';

class PrimaryTextField extends StatefulWidget {
  const PrimaryTextField({
    super.key,
    required this.hint,
    this.obscureText = false,
    this.visibilityIcon,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.controller,
    this.onSaved,
    this.onSubmitted,
  });

  final Function(dynamic value)? onSaved;
  final TextInputType?  keyboardType;

  final String hint;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? visibilityIcon;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? onSubmitted;

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  late bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final bool showVisibilityToggle =
        widget.visibilityIcon != null || widget.obscureText;

    return TextFormField(
      keyboardType: widget.keyboardType,
      onFieldSubmitted: widget.onSubmitted,
      validator: widget.validator,
      onChanged: widget.onChanged,
      controller: widget.controller,
      obscureText: _obscureText,

      decoration: InputDecoration(
        suffixIcon: showVisibilityToggle
            ? IconButton(
          onPressed: () => setState(() => _obscureText = !_obscureText),
          icon: widget.visibilityIcon ??
              Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
        )
            : null,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),

        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primaryColor),
        ),
        errorBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.warningColor),
        ),
        focusedErrorBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.warningColor),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: widget.hint,
        hintStyle: context.inputRegular14.copyWith(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}