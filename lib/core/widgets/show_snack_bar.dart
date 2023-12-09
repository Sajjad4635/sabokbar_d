import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sabokbar_d/core/theme/app_color.dart';
import 'package:sabokbar_d/core/widgets/text_widget.dart';

class ShowSnackBar {
  ScaffoldMessengerState showError({
    required BuildContext context,
    required String message,
  }) {
    return ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColor.mainYellow,
              ),
              color: Colors.white.withOpacity(0.08),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                SvgPicture.asset(
                  'assets/icons/warning_icon.svg',
                  color: AppColor.errorColor,
                ),
                const SizedBox(
                  width: 4,
                ),
                TextWidget.regular(
                  text: message,
                  color: AppColor.mainYellow,
                  alignment: TextAlign.right,
                ),
              ],
            ),
          ),
          backgroundColor: AppColor.backgroundColor,
        ),
      );
  }

  ScaffoldMessengerState showSuccessMessage({
    required BuildContext context,
    required String message,
  }) {
    return ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColor.successColor,
              ),
              color: Colors.white.withOpacity(0.2),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                SvgPicture.asset(
                  'assets/icons/success_icon.svg',
                ),
                const SizedBox(
                  width: 4,
                ),
                TextWidget.regular(
                  text: message,
                  color: Colors.white,
                  alignment: TextAlign.right,
                ),
              ],
            ),
          ),
          backgroundColor: AppColor.backgroundColor,
        ),
      );
  }
}
