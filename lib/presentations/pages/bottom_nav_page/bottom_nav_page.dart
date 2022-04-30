import 'package:code_me/data/models/nav_item_model.dart';
import 'package:code_me/domain/entities/language_item_entity.dart';
import 'package:code_me/presentations/pages/home_page/home_page.dart';
import 'package:code_me/presentations/pages/my_codes_page/my_codes_page.dart';
import 'package:code_me/presentations/pages/text_editor_page/text_editor_page.dart';
import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:code_me/presentations/widgets/custom_paint.dart';
import 'package:flutter/material.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({Key? key}) : super(key: key);

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int selectBtn = 1;
  var pages = [
    const HomePage(),
    const TextEditorPage(
      isDirect: true,
      languageItemEntity: LanguageItemEntity(
          id: 0,
          title: "title",
          imageAssets: "imageAssets",
          language: "language",
          type: "type"),
    ),
    const MyCodesPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectBtn],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: navigationBar(),
      ),
    );
  }

  AnimatedContainer navigationBar() {
    return AnimatedContainer(
      height: 50.0,
      duration: const Duration(milliseconds: 400),
      decoration: const BoxDecoration(
        color: ColorTheme.sceandaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < navitemlist.length; i++)
            GestureDetector(
              onTap: () => setState(() => selectBtn = i),
              child: iconBtn(i),
            ),
        ],
      ),
    );
  }

  SizedBox iconBtn(int i) {
    bool isActive = selectBtn == i ? true : false;
    var height = isActive ? 60.0 : 0.0;
    var width = isActive ? 50.0 : 0.0;
    return SizedBox(
      width: 60.0,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              height: height,
              width: width,
              duration: const Duration(milliseconds: 600),
              child: isActive
                  ? CustomPaint(
                      painter: ButtonNotch(),
                    )
                  : const SizedBox(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Icon(navitemlist[i].iconData,
                color: isActive ? ColorTheme.blueColor : ColorTheme.whiteColor),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Text(
          //     navitemlist[i].name,
          //     style: isActive
          //         ? GoogleFonts.openSans(color: ColorTheme.blueColor)
          //         : GoogleFonts.openSans(color: ColorTheme.sceandaryColor),
          //   ),
          // )
        ],
      ),
    );
  }
}
