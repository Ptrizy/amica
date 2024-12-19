import 'package:amica/view/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

enum CustomTextFieldType {
  inputPassword,
  inputAndHint,
  input,
  inputSearch,
  inputPasswordAndHint,
  inputAndIcon,
  inputWithIconAndHint,
  inputAndSuffix,
  inputWithSuffixAndHint
}

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final CustomTextFieldType type;
  final String hintText;
  final bool obscure;
  final TextInputType keyboardType;
  final Color? backgroundColor;
  final double? width;
  final String? suffixText;
  final String? suffixIcon;
  final String openedEyeIcon;
  final String closedEyeIcon;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.type,
    required this.hintText,
    this.obscure = false,
    this.keyboardType = TextInputType.text,
    this.backgroundColor,
    this.width,
    this.suffixText,
    this.suffixIcon,
    this.closedEyeIcon = 'assets/eye_line_slash.svg',
    this.openedEyeIcon = 'assets/eye_line.svg',
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;
  Color textColor = ColorStyles.neutral600;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    isObscure = widget.obscure;
    widget.controller.addListener(_updateTextfieldWhenFilled);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateTextfieldWhenFilled);
    super.dispose();
  }

  void _updateTextfieldWhenFilled() {
    setState(() {
      textColor = widget.controller.text.isEmpty
          ? ColorStyles.neutral600
          : ColorStyles.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor = widget.backgroundColor ?? Colors.white;
    double widths = widget.width ?? double.infinity;
    return Container(
      height: 48.h,
      width: widths,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() {
            isFocused = hasFocus;
          });
        },
        child: TextField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscure && isObscure,
          decoration: _getDecoration(),
          style: GoogleFonts.dynaPuff(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: ColorStyles.neutral600),
        ),
      ),
    );
  }

  InputDecoration _getDecoration() {
    final padding = EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h);

    final hintStyle = GoogleFonts.dynaPuff(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorStyles.neutral600);

    final labelStyle = GoogleFonts.dynaPuff(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: ColorStyles.neutral600);

    final suffixIcon = widget.obscure
        ? InkWell(
            onTap: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            child: UnconstrainedBox(
              child: SvgPicture.asset(
                isObscure ? widget.closedEyeIcon : widget.openedEyeIcon,
              ),
            ),
          )
        : (widget.suffixIcon != null
            ? InkWell(
                onTap: () {},
                child: UnconstrainedBox(
                  child: SvgPicture.asset(
                    widget.suffixIcon!,
                  ),
                ),
              )
            : null);

    Widget? suffixTextWidget = widget.suffixText != null
        ? Text(
            widget.suffixText!,
            style: GoogleFonts.dynaPuff(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: ColorStyles.neutral600),
          )
        : null;

    switch (widget.type) {
      case CustomTextFieldType.inputPassword:
        return InputDecoration(
          hintText: widget.hintText,
          labelStyle: labelStyle,
          hintStyle: hintStyle,
          suffixIcon: suffixIcon,
          contentPadding: padding,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        );
      case CustomTextFieldType.inputAndHint:
        return InputDecoration(
          hintText: widget.hintText,
          labelStyle: labelStyle,
          hintStyle: hintStyle,
          contentPadding: padding,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        );
      case CustomTextFieldType.input:
        return InputDecoration(
          focusColor: ColorStyles.primary,
          hintText: widget.hintText,
          labelStyle: labelStyle,
          hintStyle: hintStyle,
          contentPadding: padding,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        );
      case CustomTextFieldType.inputSearch:
        return InputDecoration(
          hintText: widget.hintText,
          hintStyle: hintStyle,
          prefixIcon: UnconstrainedBox(
            child: SvgPicture.asset('assets/icons/search.svg'),
          ),
          contentPadding: padding,
        );
      case CustomTextFieldType.inputPasswordAndHint:
        return InputDecoration(
          fillColor: ColorStyles.primary,
          hintText: widget.hintText,
          labelStyle: labelStyle,
          hintStyle: hintStyle,
          suffixIcon: suffixIcon,
          contentPadding: padding,
        );
      case CustomTextFieldType.inputAndIcon:
        return InputDecoration(
          hintText: widget.hintText,
          labelStyle: labelStyle,
          hintStyle: hintStyle,
          suffixIcon: suffixIcon,
          contentPadding: padding,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        );
      case CustomTextFieldType.inputWithIconAndHint:
        return InputDecoration(
          hintText: widget.hintText,
          labelStyle: labelStyle,
          hintStyle: hintStyle,
          suffixIcon: suffixIcon,
          contentPadding: padding,
        );
      case CustomTextFieldType.inputAndSuffix:
        return InputDecoration(
          labelStyle: labelStyle,
          suffix: suffixTextWidget,
          suffixStyle: GoogleFonts.dynaPuff(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: ColorStyles.neutral600),
          hintText: widget.hintText,
          hintStyle: hintStyle,
          contentPadding: padding,
        );
      case CustomTextFieldType.inputWithSuffixAndHint:
        return InputDecoration(
          labelStyle: labelStyle,
          suffix: suffixTextWidget,
          suffixStyle: GoogleFonts.dynaPuff(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: ColorStyles.neutral600),
          hintText: widget.hintText,
          hintStyle: hintStyle,
          contentPadding: padding,
        );
    }
  }
}
