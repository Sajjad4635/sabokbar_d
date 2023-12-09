import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class ShimmerServicesLoadingWidget extends StatelessWidget {
  const ShimmerServicesLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerColor,
      highlightColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container()
      ),
    );
  }
}
