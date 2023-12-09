import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sabokbar_d/core/widgets/text_widget.dart';

import '../theme/app_color.dart';

class PropertyWidget extends StatelessWidget {
  final String icon;
  final Color iconColor;
  final String propertyName;
  final Color propertyColor;

  const PropertyWidget({required this.icon, required this.iconColor, required this.propertyName, required this.propertyColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.textColor2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 22,
            width: 22,
            child: SvgPicture.asset(
              icon,
              color: iconColor,
            ),
          ),
          TextWidget.medium(
            text: propertyName,
            fontSize: 13,
            color: propertyColor,
          ),
        ],
      ),
    );
  }
}
