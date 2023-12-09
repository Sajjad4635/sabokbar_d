import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sabokbar_d/core/theme/app_color.dart';
import 'package:sabokbar_d/features/splash/presentation/pages/splash_screen.dart';
import 'package:sabokbar_d/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColor.mainYellow,
      ),
    );
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: const MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      )
    );
  }
}