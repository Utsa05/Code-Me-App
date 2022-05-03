import 'package:code_me/common/constants/route_constants.dart';
import 'package:code_me/data/models/compile_request_model.dart';
import 'package:code_me/domain/entities/language_item_entity.dart';
import 'package:code_me/presentations/pages/bottom_nav_page/bottom_nav_page.dart';
import 'package:code_me/presentations/pages/home_page/home_page.dart';
import 'package:code_me/presentations/pages/my_codes_page/my_codes_page.dart';
import 'package:code_me/presentations/pages/run_code_page/run_code_page.dart';
import 'package:code_me/presentations/pages/text_editor_page/text_editor_page.dart';
import 'package:code_me/presentations/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;

    switch (settings.name) {
      case RouteCons.initial:
        return MaterialPageRoute(builder: (context) => const BottomNavPage());
      case RouteCons.bottomnavRoute:
        return MaterialPageRoute(builder: (context) => const BottomNavPage());

      case RouteCons.homeRoute:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case RouteCons.favcodeRoue:
        return MaterialPageRoute(builder: (context) => const MyCodesPage());
      case RouteCons.texteditorRoue:
        return MaterialPageRoute(
            builder: (context) => TextEditorPage(
                  isDirect: false,
                  languageItemEntity: arg as LanguageItemEntity,
                ));

      case RouteCons.complileRoute:
        return MaterialPageRoute(
            builder: (context) => RunCodePage(
                  compileModel: arg as CompileRequestModel,
                ));

      default:
        return _errorroute();
    }
  }

  static Route<dynamic> _errorroute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const TextWidget(
            title: 'Wrong Route',
          ),
        ),
      );
    });
  }
}
