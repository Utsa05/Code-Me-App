import 'package:code_me/common/constants/pm_constants.dart';
import 'package:code_me/common/constants/size_constants.dart';
import 'package:code_me/common/constants/string_constants.dart';
import 'package:code_me/common/extensions/size_extensions.dart';
import 'package:code_me/presentations/pages/home_page/home_utils/home_body.dart';
import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:code_me/presentations/widgets/button_widget.dart';
import 'package:code_me/presentations/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.0,
        title: Column(
          children: [
            TextWidget(
              title: StringCons.appName,
              size: Sizes.dimen_14.h,
              color: Colors.white,
            ),
          ],
        ),
        elevation: PMCons.no,
        backgroundColor: ColorTheme.primaryColor,
        actions: [
          CircleBbttonWidget(
              color: ColorTheme.blueColor,
              child: Image.asset('assets/icons/codemeblueicon.png'),
              tap: () {}),
        ],
      ),
      body: const HomeBody(),
    );
  }
}
