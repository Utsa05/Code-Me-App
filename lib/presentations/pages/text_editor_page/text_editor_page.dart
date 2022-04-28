import 'dart:math';

import 'package:code_me/common/constants/size_constants.dart';
import 'package:code_me/data/core/code_help_item.dart';
import 'package:code_me/presentations/pages/run_code_page/run_code_page.dart';
import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:code_me/presentations/widgets/button_widget.dart';
import 'package:code_me/presentations/widgets/text_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';

import 'package:flutter_highlight/themes/gradient-dark.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:highlight/languages/dart.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_highlight/themes/lightfair.dart';
import 'package:flutter_highlight/themes/default.dart';

import 'text_editor_utils/need_classes.dart';

class TextEditorPage extends StatefulWidget {
  const TextEditorPage({Key? key}) : super(key: key);

  @override
  State<TextEditorPage> createState() => _TextEditorPageState();
}

class _TextEditorPageState extends State<TextEditorPage> {
  CodeController? _codeController;
  Map<String, TextStyle> themesource = monokaiSublimeTheme;
  var source =
      '//c++ programme\n\n #include<bits/stdc++.h>\nusing namespace std;\n\n//your main function\nint main()\n{\ncout <<"Hello World!";	\n\nreturn(0);\n}\n';

  @override
  void initState() {
    super.initState();

    _codeController = CodeController(
      text: source,
      language: dart,
      theme: themesource,
    );
  }

  void changeLanguageSource(String language) {
    if (language == "C++") {
      source =
          '//c++ programme\n\n #include<bits/stdc++.h>\nusing namespace std;\n\n//your main function\nint main()\n{\ncout <<"Hello World!";	\n\nreturn(0);\n}\n';
    } else if (language == 'Python') {
      source = '//Python Programme\n\n print("Hello World!")';
    } else if (language == 'Python 3') {
      source = '//Python 3 Programme\n\n print("Hello World!")';
    } else if (language == 'Java') {
      source =
          '//Java Programme\n\n class Java\n{\n public static void main(string[] args){\n\nSystem.out.println("Hello World!")\n\n}\n}';
    } else if (language == 'PHP') {
      source = '//PHP Programme\n\n<?php\n\necho "Hello World!"\n\n?>';
    } else if (language == 'Perl') {
      source =
          '//Perl Programme\n\n#!/usr/bin/perl\n\n# Modules used\nuse strict;\nuse warnings;\n\nprint("Hello World\n");';
    } else {
      source =
          '//Scala Programme\n\nobject Geeks\n{\n// Main Method \ndef main(args: Array[String]) \n{\n println("Hello World!")\n}\n}';
    }

    _codeController = CodeController(
      text: source,
      language: dart,
      theme: themesource,
    );

    setState(() {});
  }

  void changeThemeSource(String theme) {
    if (theme == 'Default') {
      themesource = monokaiSublimeTheme;
    } else if (theme == 'Lightfair') {
      themesource = lightfairTheme;
    } else if (theme == 'Gradient Dark') {
      themesource = gradientDarkTheme;
    } else {
      themesource = defaultTheme;
    }

    _codeController = CodeController(
      text: source,
      language: dart,
      theme: themesource,
    );

    setState(() {});
  }

  void insert(String content) {
    var text = _codeController!.text;
    var pos = _codeController!.selection.start;
    _codeController!.value = TextEditingValue(
      text: text.substring(0, pos) + content + text.substring(pos),
      selection: TextSelection.collapsed(offset: pos + content.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CircleBbttonWidget(
            tap: () {},
            iconSize: Sizes.dimen_24,
            child: const Icon(EvaIcons.heartOutline),
            color: ColorTheme.redColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                buttonHeight: 34.0,
                customButton: const Icon(
                  EvaIcons.colorPaletteOutline,
                  size: 24,
                  color: ColorTheme.successColor,
                ),
                customItemsIndexes: const [4],
                customItemsHeight: 8,
                items: [
                  ...ThemeMenuItems.firstItems.map(
                    (item) => DropdownMenuItem<MenuItem>(
                      value: item,
                      child: ThemeMenuItems.buildItem(item),
                    ),
                  ),
                ],
                onChanged: (value) {
                  switch (value) {
                    case ThemeMenuItems.defaultt:
                      changeThemeSource('Default');
                      break;
                    case ThemeMenuItems.light:
                      changeThemeSource('Light');
                      //Do something
                      break;
                    case ThemeMenuItems.gradidark:
                      changeThemeSource('Gradient Dark');
                      //Do something
                      break;
                    case ThemeMenuItems.lightfair:
                      changeThemeSource('Lightfair');
                      //Do something
                      break;
                  }
                },
                itemHeight: 48,
                itemPadding: const EdgeInsets.only(left: 16, right: 16),
                dropdownWidth: 160,
                dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: ColorTheme.successColor,
                ),
                dropdownElevation: 8,
                offset: const Offset(0, 8),
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          )
          // CircleBbttonWidget(
          //   tap: () {},
          //   iconSize: Sizes.dimen_20,
          //   child: const Icon(EvaIcons.colorPaletteOutline),
          //   color: ColorTheme.successColor,
          // ),
          // CircleBbttonWidget(
          //   tap: () {},
          //   iconSize: Sizes.dimen_20,
          //   child: const Icon(Icons.merge_type),
          //   color: const Color.fromARGB(255, 255, 245, 109),
          // ),
          ,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                customButton: const Icon(
                  Icons.text_format_outlined,
                  size: 29,
                  color: Colors.indigo,
                ),
                customItemsIndexes: const [7],
                customItemsHeight: 8,
                items: [
                  ...LanguageMenuItems.firstItems.map(
                    (item) => DropdownMenuItem<LanguageItem>(
                      value: item,
                      child: LanguageMenuItems.buildItem(item),
                    ),
                  ),
                ],
                onChanged: (value) {
                  switch (value) {
                    case LanguageMenuItems.cpp:
                      changeLanguageSource('Cpp');

                      break;
                    case LanguageMenuItems.python:
                      changeLanguageSource('Python');
                      break;
                    case LanguageMenuItems.python3:
                      changeLanguageSource('Python 3');
                      //Do something
                      break;
                    case LanguageMenuItems.java:
                      changeLanguageSource('Java');
                      //Do something
                      break;
                    case LanguageMenuItems.php:
                      changeLanguageSource('PHP');
                      //Do something
                      break;

                    case LanguageMenuItems.perl:
                      changeLanguageSource('Perl');
                      //Do something
                      break;

                    case LanguageMenuItems.scala:
                      changeLanguageSource('Scala');
                      //Do something
                      break;
                  }
                },
                itemHeight: 48,
                itemPadding: const EdgeInsets.only(left: 16, right: 16),
                dropdownWidth: 160,
                dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.indigo,
                ),
                dropdownElevation: 8,
                offset: const Offset(0, 8),
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          )
        ],
        // centerTitle: true,
        title: ButtonWidget(
          width: 55.0,
          color: Colors.blueGrey,
          tap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const RunCodePage())));
          },
          child: const TextWidget(
            color: ColorTheme.whiteColor,
            title: 'Play',
            size: Sizes.dimen_16,
          ),
        ),
        elevation: 0.0,
        backgroundColor: ColorTheme.primaryColor,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: Sizes.dimen_6, vertical: Sizes.dimen_4),
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: CodeField(
                    maxLines: 25,
                    controller: _codeController!,
                    textStyle: GoogleFonts.openSans(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: codehelpItemList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: ButtonWidget(
                          width: 55,
                          elevaiton: 0.0,
                          color: ColorTheme.blueColor,
                          child: TextWidget(
                            title: codehelpItemList[index]['name'],
                          ),
                          height: 30,
                          radius: 8,
                          tap: () {
                            if (codehelpItemList[index]['name'] == "Clr") {
                              setState(() {
                                _codeController!.text = "";
                              });
                            } else {
                              insert(codehelpItemList[index]['value']);
                            }
                          }),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
