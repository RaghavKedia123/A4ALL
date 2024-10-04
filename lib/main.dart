import 'package:divyam_flutter/core/constants/figma_constants.dart';
import 'package:divyam_flutter/core/managers/app_manager.dart';
import 'package:divyam_flutter/core/themes/app_themes.dart';
import 'package:divyam_flutter/features/authentication/domain/entity/register_screen_two_entity.dart';
import 'package:divyam_flutter/features/authentication/presentation/pages/register_screen_two.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/pages/business_directory_screen.dart';
import 'package:divyam_flutter/router/app_routes.dart';
import 'package:divyam_flutter/router/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppManager.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        FigmaValueConstants.screenWidth,
        FigmaValueConstants.screenHeight,
      ),
      builder: (_, child) => MaterialApp(
        themeMode: ThemeMode.light,
        theme: AppThemes.lightTheme,
        debugShowCheckedModeBanner: false,
        title: 'Divyam Flutter',
        initialRoute: AppRouter.home,
        onGenerateRoute: CustomNavigator.controller,
        navigatorKey: kNavigatorKey,
        scrollBehavior: ScrollConfiguration.of(context).copyWith(
          physics: const BouncingScrollPhysics(),
        ),
        home: BusinessDirectoryScreen()
      ),
    );
  }
}
