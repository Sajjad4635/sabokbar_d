import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sabokbar_d/core/theme/app_color.dart';
import 'package:sabokbar_d/core/widgets/text_widget.dart';

class TopPageWidget extends StatefulWidget {
  String title;
  Color? titleColor;

  TopPageWidget({
    Key? key,
    required this.title,
    this.titleColor,
  }) : super(key: key);

  @override
  State<TopPageWidget> createState() => _TopPageWidgetState();
}

class _TopPageWidgetState extends State<TopPageWidget> {
  bool noImageItem = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    right: 8,
                    bottom: 8,
                  ),
                  child: SvgPicture.asset('assets/icons/back_icon.svg'),
                ),
              ),
              TextWidget.regular(
                text: widget.title,
                fontSize: 15,
                color: widget.titleColor ?? AppColor.mainYellow,
              ),
              SvgPicture.asset('assets/icons/back_icon.svg', color: Colors.transparent,),
            ],
          ),
        ],
      ),
    );
  }
}
