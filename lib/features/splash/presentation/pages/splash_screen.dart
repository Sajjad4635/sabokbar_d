import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sabokbar_d/features/login/presentation/pages/send_otp_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sabokbar_d/core/theme/app_color.dart';
import 'package:sabokbar_d/core/widgets/button_widget.dart';
import 'package:sabokbar_d/core/widgets/text_widget.dart';
import 'package:sabokbar_d/injection.dart';

// import '../../../../core/constants/string_consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const PhoneNumber() ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Image.asset('assets/images/SplashScreen.png'),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {}
  }

}
// void checkVersionAndShowPopUp(SettingResponse setting, BuildContext context) async {
//   /// pop up update or go to next event GetLocalDataEvent
//   if (Platform.isAndroid) {
//     var info = await PackageInfo.fromPlatform();
//     var appVersion = int.parse(info.version.replaceAll('.', ''));
//     var serverVersion = int.parse(setting.data!.android.version.replaceAll('.', ''));
//     if (appVersion >= serverVersion) {
//       Timer(const Duration(seconds: 2), () {
//         context.read<SplashBloc>().add(GetLocalDataEvent());
//       });
//     } else {
//       var link = setting.data!.android.url;
//       Timer(const Duration(seconds: 1), () {
//         context.read<SplashBloc>().add(
//           HandleUpdate(
//             isForced: setting.data!.android.isForced,
//             link: link,
//           ),
//         );
//       });
//     }
//   } else {
//     var info = await PackageInfo.fromPlatform();
//     var appVersion = int.parse(info.version.replaceAll('.', ''));
//     var serverVersion = int.parse(setting.data!.ios.version.replaceAll('.', ''));
//     if (appVersion >= serverVersion) {
//       Timer(const Duration(seconds: 2), () {
//         context.read<SplashBloc>().add(GetLocalDataEvent());
//       });
//     } else {
//       var link = setting.data!.ios.url;
//       Timer(const Duration(seconds: 1), () {
//         context.read<SplashBloc>().add(
//           HandleUpdate(
//             isForced: setting.data!.ios.isForced,
//             link: link,
//           ),
//         );
//       });
//     }
//   }
// }
// BlocProvider(
// create: (_) => serviceLocator<SplashBloc>()..add(GetSettingEvent()),
// child: BlocListener<SplashBloc, SplashState>(
// listener: (context, state) {
// if (state is Update) {
// checkVersionAndShowPopUp(state.setting, context);
// } else if (state is HomeScreenState) {
// Navigator.pushReplacement(
// context,
// MaterialPageRoute(
// builder: (context) => DashboardScreen(selectedIndex: 2),
// ));
// } else if (state is LoginScreenState) {
// Navigator.pushReplacement(
// context,
// MaterialPageRoute(
// builder: (context) => const LoginScreen(),
// ));
// }
// },
// child: BlocBuilder<SplashBloc, SplashState>(
// builder: (context, state) {
// if (state is ErrorInternet) {
// return Column(
// children: [
// Expanded(
// child: Center(
// child: Padding(
// padding: const EdgeInsets.all(16.0),
// child: Lottie.asset('assets/files/logo_motion.json'),
// ),
// ),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// SvgPicture.asset('assets/icons/wifi-slash.svg'),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: TextWidget.regular(
// text: NO_INTERNET_SPLASH,
// ),
// ),
// SizedBox(
// width: 140,
// child: NeumorphicButtonWidget(
// svg: 'assets/icons/retry.svg',
// text: 'تلاش مجدد',
// isEnabled: true,
// onPressed: () {
// context.read<SplashBloc>().add(GetSettingEvent());
// },
// ),
// ),
// const SizedBox(
// height: 30,
// ),
// ],
// )
// ],
// );
// } else if (state is ForceUpdate) {
// return Column(
// children: [
// Expanded(
// child: Center(
// child: Padding(
// padding: const EdgeInsets.all(16.0),
// child: Lottie.asset('assets/files/logo_motion.json'),
// ),
// ),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: TextWidget.regular(
// text: FORCE_UPDATE,
// ),
// ),
// SizedBox(
// width: 200,
// child: NeumorphicButtonWidget(
// svg: 'assets/icons/update.svg',
// text: 'بروزرسانی',
// isEnabled: true,
// onPressed: () {
// _launchUrl(state.link);
// },
// ),
// ),
// const SizedBox(
// height: 30,
// ),
// ],
// )
// ],
// );
// } else if (state is NormalUpdate) {
// return Column(
// children: [
// Expanded(
// child: Center(
// child: Padding(
// padding: const EdgeInsets.all(16.0),
// child: Lottie.asset('assets/files/logo_motion.json'),
// ),
// ),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: TextWidget.regular(
// text: FORCE_UPDATE,
// ),
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// SizedBox(
// width: 100,
// child: NeumorphicButtonWidget(
// text: 'بروزرسانی',
// isEnabled: true,
// onPressed: () {
// _launchUrl(state.link);
// },
// ),
// ),
// const SizedBox(
// width: 12,
// ),
// SizedBox(
// width: 100,
// child: NeumorphicButtonWidget(
// border: const NeumorphicBorder(color: AppColor.mainYellow, width: 2),
// text: 'انصراف',
// textStyle: const TextStyle(
// color: AppColor.mainYellow,
// ),
// isEnabled: true,
// onPressed: () {
// context.read<SplashBloc>().add(GetLocalDataEvent());
// },
// ),
// ),
// ],
// ),
// const SizedBox(
// height: 30,
// ),
// ],
// )
// ],
// );
// } else {
// return Center(
// child: Padding(
// padding: const EdgeInsets.all(16.0),
// child: Lottie.asset('assets/files/logo_motion.json'),
// ),
// );
// }
// },
// ),
// ),
// )
