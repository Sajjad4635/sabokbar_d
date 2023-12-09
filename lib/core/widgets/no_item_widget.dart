import 'package:flutter/material.dart';
import 'package:sabokbar_d/core/constants/string_consts.dart';
import 'package:sabokbar_d/core/theme/app_color.dart';
import 'package:sabokbar_d/core/widgets/text_widget.dart';

class NoItemWidget extends StatefulWidget {
  String? text;
  double? height;

  NoItemWidget({
    Key? key,
    this.text,
    this.height,
  }) : super(key: key);

  @override
  State<NoItemWidget> createState() => _NoItemWidgetState();
}

class _NoItemWidgetState extends State<NoItemWidget> {
  bool noImageItem = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          noImageItem = !noImageItem;
        });
      },
      child: SizedBox(
        width: double.infinity,
        height: widget.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 95,
              child: showNoItemWidget(noImageItem),
            ),
            const SizedBox(
              height: 32,
            ),
            TextWidget.regular(
              text: widget.text ?? NO_ITEM_TEXT,
              color: AppColor.textColor,
              textOverflow: TextOverflow.visible,
              fontSize: 13,
            ),
          ],
        ),
      ),
    );
  }

  Widget showNoItemWidget(bool noImageItem) {
    return noImageItem ? Image.asset('assets/images/no_item_image_1.png') : Image.asset('assets/images/no_item_image_2.png');
  }
}

class CustomNoItemWidget extends StatefulWidget {
  Widget? textWidget;
  double? height;

  CustomNoItemWidget({
    Key? key,
    this.textWidget,
    this.height,
  }) : super(key: key);

  @override
  State<CustomNoItemWidget> createState() => _CustomNoItemWidgetState();
}

class _CustomNoItemWidgetState extends State<CustomNoItemWidget> {
  bool noImageItem = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          noImageItem = !noImageItem;
        });
      },
      child: SizedBox(
        width: double.infinity,
        height: widget.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 95,
              child: showNoItemWidget(noImageItem),
            ),
            const SizedBox(
              height: 32,
            ),
            widget.textWidget!,
          ],
        ),
      ),
    );
  }

  Widget showNoItemWidget(bool noImageItem) {
    return noImageItem ? Image.asset('assets/images/no_item_image_1.png') : Image.asset('assets/images/no_item_image_2.png');
  }
}
