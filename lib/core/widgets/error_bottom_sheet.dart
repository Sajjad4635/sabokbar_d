import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sabokbar_d/core/constants/string_consts.dart';
import 'package:sabokbar_d/core/theme/app_color.dart';
import 'package:sabokbar_d/core/widgets/text_widget.dart';

class ShowError {
  static void noInternet({
    required BuildContext context,
    required Function? onTap,
  }) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 229,
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 44,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            color: AppColor.bottomSheetColor,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 51,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffBABECC),
                  ),
                ),
                SvgPicture.asset('assets/icons/internet_error_icon.svg'),
                TextWidget.regular(text: NO_INTERNET),
                SizedBox(
                  width: 100,
                  height: 28,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget.regular(
                        text: TRY_AGAIN_TEXT,
                        color: AppColor.textColor2,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset('assets/icons/refresh_icon.svg'),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static void serverError({
    required BuildContext context,
    required Function? onTap,
  }) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 229,
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 44,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            color: AppColor.bottomSheetColor,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 51,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffBABECC),
                  ),
                ),
                SvgPicture.asset('assets/icons/server_error_icon.svg'),
                TextWidget.regular(text: SERVER_ERROR),
                SizedBox(
                  width: 100,
                  height: 28,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget.regular(
                        text: TRY_AGAIN_TEXT,
                        color: AppColor.textColor2,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset('assets/icons/refresh_icon.svg'),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static void forbiddenError({
    required BuildContext context,
    required Function? onTap,
  }) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 229,
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 44,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            color: AppColor.bottomSheetColor,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 51,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffBABECC),
                  ),
                ),
                const SizedBox(
                  height: 27,
                ),
                SvgPicture.asset(
                  'assets/icons/warning_icon.svg',
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  height: 17,
                ),
                TextWidget.regular(text: FORBIDDEN_TEXT),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: 158,
                  // height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget.medium(
                        fontSize: 14,
                        text: CONTACT_US_TEXT,
                        color: AppColor.textColor2,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset('assets/icons/contact_us_icon.svg'),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
