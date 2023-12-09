import 'package:flutter/material.dart';
import 'package:sabokbar_d/core/theme/app_color.dart';

class SimpleToggleSwitchButton extends StatefulWidget {
  const SimpleToggleSwitchButton({Key? key}) : super(key: key);

  @override
  State<SimpleToggleSwitchButton> createState() => _SimpleToggleSwitchButtonState();
}

class _SimpleToggleSwitchButtonState extends State<SimpleToggleSwitchButton> {
  bool light0 = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          activeColor: AppColor.mainYellow,
          value: light0,
          onChanged: (bool value) {
            setState(() {
              light0 = value;
            });
          },
        ),
      ],
    );
  }
}
