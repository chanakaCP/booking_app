import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../../styles/font_styles.dart';

class CustomInputField extends StatefulWidget {
  TextEditingController controller;
  final String? hintText;
  final String? lableText;
  final TextInputType inputType;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Alignment alignment;
  final Function? onChange;
  final String? errorText;
  final bool isEnabled;
  final String? Function(String?)? validator;

  CustomInputField({
    Key? key,
    required this.controller,
    this.hintText = "",
    this.inputType = TextInputType.text,
    this.margin,
    this.padding,
    this.alignment = Alignment.centerLeft,
    this.onChange,
    this.errorText,
    this.isEnabled = true,
    this.validator,
    this.lableText = "",
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomFormInputState();
}

class _CustomFormInputState extends State<CustomInputField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode(canRequestFocus: false);
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      color: transparent,
      child: TextFormField(
        controller: widget.controller,
        style: inputStyle(),
        validator: widget.validator,
        focusNode: _focusNode,
        keyboardType: widget.inputType,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: transparent,
          enabled: widget.isEnabled,
          hintText: widget.hintText,
          counterText: "",
          errorMaxLines: 2,
          errorText: widget.errorText,
          errorStyle: errorLableStyle(),
          contentPadding: const EdgeInsets.only(bottom: 10),
          hintStyle: hintStyle(),
          labelText: widget.lableText ?? '',
          labelStyle: defaultLableStyle(),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: black),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: black),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: black),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: red),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: black),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: black.withOpacity(0.5),
            ),
          ),
        ),
        onChanged: (value) {
          if (widget.onChange != null) {
            widget.onChange!(value);
          }
        },
      ),
    );
  }
}
