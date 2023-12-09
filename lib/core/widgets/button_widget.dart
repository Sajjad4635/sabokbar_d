import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sabokbar_d/core/theme/app_color.dart';
import 'package:sabokbar_d/core/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final bool isEnabled;
  final double depth;
  final double borderRadius;
  final String text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? textFontSize;
  final Color? btnColor;
  final Function() onPressed;
  final TextStyle? textStyle;
  final double height;
  final double width;
  final TextAlign textAlign;
  final String? svg;

  const ButtonWidget({
    Key? key,
    required this.isEnabled,
    this.depth = 2.5,
    this.borderRadius = 10.0,
    required this.onPressed,
    this.text = 'تایید',
    this.textColor,
    this.fontWeight,
    this.textFontSize = 14,
    this.btnColor,
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w700,
    ),
    this.height = 48,
    this.width = double.infinity,
    this.textAlign = TextAlign.center,
    this.svg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.blue,
        ),
        child: Center(
          child: svg != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextWidget.bold(
                      text: text,
                      fontSize: textFontSize,
                      color: AppColor.textColor2,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    SvgPicture.asset(svg!),
                  ],
                )
              : TextWidget.regular(
                  text: text,
                  fontSize: 16,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
