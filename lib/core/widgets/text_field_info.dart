import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../theme/app_color.dart';

class TextFieldInfoWidget extends StatelessWidget {
  final String? hintText;
  final String? initValue;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType inputType;
  final Function onChanged;
  final TextEditingController controller;

  // final Function()? onValidator;
  final int? maxLength;
  final int? minLength;

  const TextFieldInfoWidget({
    Key? key,
    required this.hintText,
    this.maxLength,
    // required this.onValidator,
    required this.inputType,
    this.suffixIcon,
    this.prefixIcon,
    required this.controller,
    required this.onChanged,
    this.minLength,
    this.initValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initValue,
      cursorColor: AppColor.mainYellow,
      textAlign: TextAlign.center,
      onChanged: (text) {
        if (onChanged != null) {
          onChanged!(text);
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        hintStyle: TextStyle(
          color: AppColor.hintColorTextField,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text('*', style: TextStyle(color: AppColor.errorColor, fontSize: 20)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
        color: AppColor.textColor,
      ),
      onSaved: (String? value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
      keyboardType: inputType,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.deny(RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
        LengthLimitingTextInputFormatter(maxLength),
        LengthLimitingTextInputFormatter(minLength),
      ],
    );
  }
}
