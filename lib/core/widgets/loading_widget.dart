import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sabokbar_d/core/theme/app_color.dart';

class LoadingWidget extends StatelessWidget {
  final double size;

  const LoadingWidget({
    Key? key,
    this.size = 25.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: AppColor.mainYellow,
      size: size,
    );
  }
}
