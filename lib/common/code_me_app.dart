import 'package:code_me/common/app_routes.dart';
import 'package:code_me/common/constants/route_constants.dart';
import 'package:code_me/common/screenutil/screenutil.dart';

import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:flutter/material.dart';

class CodeMeApp extends StatelessWidget {
  const CodeMeApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Code Me',
      theme: ThemeData(
        unselectedWidgetColor: ColorTheme.sceandaryColor,
        primaryColor: ColorTheme.primaryColor,
        scaffoldBackgroundColor: ColorTheme.primaryColor,
        brightness: Brightness.light,
        cardTheme: const CardTheme(
          color: ColorTheme.whiteColor,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(elevation: 0),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorTheme.blueColor,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorTheme.whiteColor)),
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: ColorTheme.redColor),
      ),
      initialRoute: RouteCons.initial,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
