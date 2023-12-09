import 'package:flutter/material.dart';
import 'package:sabokbar_d/core/widgets/text_widget.dart';

import '../theme/app_color.dart';

class FooterPropertyWidget extends StatelessWidget {
  final String captionString;
  final String captionData;

  const FooterPropertyWidget({Key? key, required this.captionString, required this.captionData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //todo
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: TextWidget.regular(
              text: captionData,
              fontSize: 13,
              color: AppColor.textColor,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: TextWidget.regular(
              text: captionString,
              fontSize: 13,
              color: AppColor.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
