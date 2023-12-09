import 'package:flutter/material.dart';
import 'package:sabokbar_d/core/theme/app_color.dart';
import 'package:sabokbar_d/core/widgets/text_widget.dart';

class CheckBoxWidget extends StatelessWidget {
  bool value;
  ValueChanged<bool> onChanged;
  final String text;

  CheckBoxWidget({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return GestureDetector(
          onTap: () {
            setState(() {
              if (value) {
                value = false;
                onChanged(value);
              } else {
                value = true;
                onChanged(value);
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: value ? AppColor.mainYellow : AppColor.backgroundColor),
                  child: value
                      ? const Icon(
                    Icons.check,
                    size: 18,
                    color: Colors.white,
                  )
                      : null,
                ),
                const SizedBox(
                  width: 10,
                ),
                TextWidget.regular(
                  text: text,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomCheckBoxWidget extends StatelessWidget {
  bool value;
  ValueChanged<bool> onChanged;
  final Widget widgetText;

  CustomCheckBoxWidget({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.widgetText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return GestureDetector(
          onTap: () {
            setState(() {
              if (value) {
                value = false;
                onChanged(value);
              } else {
                value = true;
                onChanged(value);
              }
            });
          },
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: value ? AppColor.mainYellow : AppColor.backgroundColor),
                child: value
                    ? const Icon(
                  Icons.check,
                  size: 18,
                  color: Colors.white,
                )
                    : null,
              ),
              const SizedBox(
                width: 10,
              ),
              widgetText,
            ],
          ),
        );
      },
    );
  }
}
