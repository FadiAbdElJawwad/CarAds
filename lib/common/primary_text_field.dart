import 'package:car_ads/core/extension/app_sizes.dart';
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
    this.icon,
    this.suffixIcon,
    this.label,
    this.isBorderVisible = true,
    this.onTap,
    this.focusNode,
    this.maxLines = 1,
    this.minLines,
  });

  final Function(dynamic value)? onSaved;
  final TextInputType? keyboardType;

  final String hint;
  final String? label;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? visibilityIcon;
  final Widget? icon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool isBorderVisible;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final int? maxLines;
  final int? minLines;

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: context.inputRegular14.copyWith(fontSize: 12),
          ),
          context.addVerticalSpace(4),
        ],
        TextFormField(
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          focusNode: widget.focusNode,
          onTap: widget.onTap,
          keyboardType: widget.keyboardType,
          onFieldSubmitted: widget.onSubmitted,
          validator: widget.validator,
          onChanged: widget.onChanged,
          controller: widget.controller,
          obscureText: _obscureText,
          style: context.bodyBold.copyWith(fontSize: 16),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: widget.isBorderVisible
                ? const EdgeInsets.all(16)
                : EdgeInsets.zero,
            prefixIcon: widget.icon,
            suffixIcon: showVisibilityToggle
                ? IconButton(
                    onPressed: () =>
                        setState(() => _obscureText = !_obscureText),
                    icon:
                        widget.visibilityIcon ??
                        Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                  )
                : widget.suffixIcon,
            enabledBorder: !widget.isBorderVisible
                ? InputBorder.none
                : const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
            focusedBorder: !widget.isBorderVisible
                ? InputBorder.none
                : OutlineInputBorder(
                    borderSide: BorderSide(color: ColorManager.primaryColor),
                  ),
            errorBorder: !widget.isBorderVisible
                ? InputBorder.none
                : OutlineInputBorder(
                    borderSide: BorderSide(color: ColorManager.warningColor),
                  ),
            focusedErrorBorder: !widget.isBorderVisible
                ? InputBorder.none
                : OutlineInputBorder(
                    borderSide: BorderSide(color: ColorManager.warningColor),
                  ),
            border: !widget.isBorderVisible
                ? InputBorder.none
                : const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
            hintText: widget.hint,
            hintStyle: context.inputRegular14.copyWith(color: Colors.grey),
            filled: widget.isBorderVisible,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
