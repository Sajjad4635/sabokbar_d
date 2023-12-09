import 'package:sabokbar_d/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppMainContainer extends StatelessWidget {
  const AppMainContainer({Key? key, required this.child, this.padding = const EdgeInsets.symmetric(vertical: 18, horizontal: 14)}) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
          top: 28,
          left: 24,
          right: 24,
          bottom: 0,
        ),
        child: Padding(
          padding: padding,
          child: child,
        )
    );
  }
}
