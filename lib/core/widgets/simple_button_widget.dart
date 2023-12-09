import 'package:flutter/material.dart';
import 'package:sabokbar_d/core/widgets/text_widget.dart';

class SimpleButtonWidget extends StatelessWidget {
  final bool isEnabled;
  final double borderRadius;
  final String text;
  final double? textFontSize;
  final Color? btnColor;
  final Color? txtColor;
  final Color btnBorderColor;
  final Function() onTap;
  final TextStyle? textStyle;
  final double height;
  final double width;

  const SimpleButtonWidget({
    Key? key,
    required this.isEnabled,
    required this.borderRadius,
    required this.text,
    this.textFontSize,
    required this.btnColor,
    required this.onTap,
    this.textStyle,
    required this.height,
    required this.width,
    required this.btnBorderColor,
    this.txtColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: btnColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            border: Border.all(color: btnBorderColor)),
        child: Center(
          child: TextWidget.bold(
            text: text,
            fontSize: textFontSize,
            color: txtColor,
          ),
        ),
      ),
    );
  }
}
