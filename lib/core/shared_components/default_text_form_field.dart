import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../text_styles/styles.dart';



class DefaultTextFormField extends StatefulWidget {
  int? maxLength;
  int? maxLines;
  bool isEnabled;
  bool required;
  bool isPassword;
  bool isFilled;
  bool hasBorder;
  bool autoFocus;
  bool readOnly;
  double contentPaddingVertical;
  double contentPaddingHorizontal;
  double borderRadius;
  double borderSideWidth;
  Color enabledBorderRadiusColor;
  Color? borderSideColor;
  Color? borderSideEnabledColor;
  Color? labelColorActive;
  String? validationMsg;
  TextInputType textInputType;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Function? onPressSuffixIcon;
  Function(String)? onFilledSubmit;
  Function(String)? onChange;
  Function? validation;
  Function? onTap;
  String? labelText;
  String? hintText;
  TextEditingController controller;
  Color? fillColor;
  TextStyle? style;

  DefaultTextFormField({
    Key? key,
    this.isPassword = false,
    this.autoFocus = false,
    this.readOnly = false,
    this.isFilled = false,
    this.hasBorder = true,
    this.labelColorActive,
    this.required = true,
    this.isEnabled = true,
    this.borderSideWidth = 1.0,
    this.contentPaddingHorizontal = 10.0,
    this.borderSideColor,
    this.contentPaddingVertical = 10.0,
    this.borderRadius = 10,
    this.enabledBorderRadiusColor = Colors.grey,
    this.maxLength,
    this.maxLines,
    this.labelText,
    this.hintText,
    required this.textInputType,
    required this.controller,
    this.onFilledSubmit,
    this.onChange,
    this.borderSideEnabledColor,
    this.onTap,
    this.onPressSuffixIcon,
    this.validation,
    this.suffixIcon,
    this.prefixIcon,
    this.validationMsg,
    this.style,
    this.fillColor,
  }) : super(key: key);

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  late FocusNode myFocusNode;
  bool hidePassword = true;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      style: widget.style,
      readOnly: widget.readOnly,
      obscureText: widget.isPassword && hidePassword,
      focusNode: myFocusNode,
      autofocus: widget.autoFocus,
      enabled: widget.isEnabled,
      obscuringCharacter: '●',
      controller: widget.controller,
      keyboardType: widget.textInputType,
      onFieldSubmitted: (value) {
        if (widget.onFilledSubmit != null) {
          widget.onFilledSubmit!(value);
        }
      },
      onChanged: (value) {
        if (widget.onChange != null) {
          widget.onChange!(value);
        }
      },
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      validator: (String? value) {
        if (widget.validation != null) {
          return widget.validation!(value);
        } else if (value!.isEmpty && widget.required) {
          return widget.validationMsg ?? "validationText".tr();
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          vertical: widget.contentPaddingVertical,
          horizontal: widget.contentPaddingHorizontal,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              widget.borderRadius,
            ),
          ),
          borderSide: (!widget.hasBorder)
              ? BorderSide.none
              : BorderSide(
            color: widget.borderSideColor?? CustomColor.primaryColor,
            width: widget.borderSideWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              widget.borderRadius,
            ),
          ),
          borderSide: (!widget.hasBorder)
              ? BorderSide.none
              : BorderSide(
            color: widget.borderSideColor?? CustomColor.primaryColor,
            width: widget.borderSideWidth,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              widget.borderRadius,
            ),
          ),
          borderSide: (!widget.hasBorder)
              ? BorderSide.none
              : BorderSide(
            color: widget.borderSideEnabledColor?? Colors.grey.shade300,
            width: widget.borderSideWidth,
          ),
        ),
        filled: true,
        fillColor: const Color(0xffF3F5FA),
        prefixIcon: widget.prefixIcon,
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle:Styles.hintText(context),
        errorMaxLines: 2,
        labelStyle: TextStyle(
            color: myFocusNode.hasFocus ? widget.labelColorActive?? CustomColor.primaryColor : widget.labelColorActive??Colors.grey,
            fontSize: MediaQuery.of(context).size.height*.02
        ),
        suffixIcon: widget.suffixIcon ?? (widget.isPassword
            ? IconButton(
          onPressed: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          icon: Icon(
            hidePassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: myFocusNode.hasFocus
                ? CustomColor.primaryColor
                : Colors.grey,
          ),
        )
            : null),
      ),
    );
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }
}