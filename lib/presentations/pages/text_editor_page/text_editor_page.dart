// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:code_me/common/constants/route_constants.dart';
import 'package:code_me/common/constants/size_constants.dart';
import 'package:code_me/data/core/code_help_item.dart';
import 'package:code_me/data/models/compile_request_model.dart';
import 'package:code_me/domain/entities/language_item_entity.dart';
import 'package:code_me/presentations/cubits/localCubit/local_cubit_cubit.dart';
import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:code_me/presentations/widgets/button_widget.dart';
import 'package:code_me/presentations/widgets/text_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_highlight/themes/gradient-dark.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_highlight/themes/lightfair.dart';
import 'package:flutter_highlight/themes/default.dart';

import 'text_editor_utils/need_classes.dart';
import 'package:highlight/languages/cpp.dart';
import 'package:highlight/languages/python.dart';
import 'package:highlight/languages/java.dart';
import 'package:highlight/languages/php.dart';
import 'package:highlight/languages/perl.dart';
import 'package:highlight/languages/scala.dart';

class TextEditorPage extends StatefulWidget {
  const TextEditorPage(
      {Key? key, required this.isDirect, required this.languageItemEntity})
      : super(key: key);
  final bool isDirect;
  final LanguageItemEntity languageItemEntity;

  @override
  State<TextEditorPage> createState() => _TextEditorPageState();
}

class _TextEditorPageState extends State<TextEditorPage> {
  CodeController? _codeController;
  Map<String, TextStyle> themesource = monokaiSublimeTheme;
  var languageSource = cpp;
  var languageType = "cpp";
  late var favLanguage;
  final TextEditingController fileController = TextEditingController();
  late CompileRequestModel compileRequestModel =
      CompileRequestModel(language: 'cpp', code: source, input: '', save: true);
  var source =
      '//c++ programme\n\n #include<bits/stdc++.h>\nusing namespace std;\n\n//your main function\nint main()\n{\ncout <<"Hello World!";	\n\nreturn 0;\n}\n';

  @override
  void initState() {
    super.initState();
    print(widget.languageItemEntity.id);

    checkLanguageChoose(widget.languageItemEntity.id);
  }

  @override
  void dispose() {
    _codeController!.dispose();
    super.dispose();
  }

  void checkLanguageChoose(int id) {
    if (id == 0) {
      _codeController = CodeController(
          text: source,
          language: languageSource,
          theme: themesource,
          onChange: (value) {
            setState(() {
              source = value;
              compileRequestModel = CompileRequestModel(
                  language: languageType, code: source, input: "", save: true);
            });
          });

      compileRequestModel = CompileRequestModel(
          language: languageType, code: source, input: "", save: true);
    } else if (id == 100) {
      if (widget.languageItemEntity.language == 'Python') {
        favLanguage = python;
        languageType = 'python';
        source = widget.languageItemEntity.code!;

        _codeController = CodeController(
            text: source,
            language: favLanguage,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else if (widget.languageItemEntity.language == 'Java') {
        favLanguage = java;
        languageType = 'java';
        source = widget.languageItemEntity.code!;
        _codeController = CodeController(
            text: source,
            language: favLanguage,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else if (widget.languageItemEntity.language == 'Perl') {
        favLanguage = perl;
        languageType = 'perl';
        source = widget.languageItemEntity.code!;
        _codeController = CodeController(
            text: source,
            language: favLanguage,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else if (widget.languageItemEntity.language == 'Php') {
        favLanguage = php;
        languageType = 'php';
        source = widget.languageItemEntity.code!;
        _codeController = CodeController(
            text: source,
            language: favLanguage,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else if (widget.languageItemEntity.language == 'C++') {
        favLanguage = cpp;
        languageType = 'cpp';
        source = widget.languageItemEntity.code!;
        _codeController = CodeController(
            text: source,
            language: favLanguage,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else if (widget.languageItemEntity.language == 'Scala') {
        favLanguage = scala;
        languageType = 'scala';
        source = widget.languageItemEntity.code!;
        _codeController = CodeController(
            text: source,
            language: favLanguage,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else if (widget.languageItemEntity.language == 'Python 3') {
        favLanguage = python;
        languageType = 'python';
        source = widget.languageItemEntity.code!;
        _codeController = CodeController(
            text: source,
            language: favLanguage,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else {
        _codeController = CodeController(
          text: source,
          language: favLanguage,
          onChange: (val) {
            setState(() {
              source = val;
              compileRequestModel = CompileRequestModel(
                  language: languageType, code: source, input: "", save: true);
            });
          },
          theme: themesource,
        );
      }

      _codeController = CodeController(
        text: source,
        language: favLanguage,
        onChange: (val) {
          setState(() {
            source = val;
            compileRequestModel = CompileRequestModel(
                language: languageType, code: source, input: "", save: true);
          });
        },
        theme: themesource,
      );

      compileRequestModel = CompileRequestModel(
          language: languageType, code: source, input: "", save: true);

      setState(() {});
    } else {
      changeLanguageSource(widget.languageItemEntity.language);
    }
  }

  void changeLanguageSource(String language) {
    if (widget.languageItemEntity.id != 100) {
      if (language == "C++") {
        languageSource = cpp;
        languageType = 'cpp';
        source =
            '//c++ programme\n\n #include<bits/stdc++.h>\nusing namespace std;\n\n//your main function\nint main()\n{\ncout <<"Hello World!";	\n\nreturn 0;\n}\n';

        _codeController = CodeController(
            text: source,
            language: languageSource,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else if (language == 'Python') {
        languageSource = python;
        languageType = 'python';
        source = '//Python Programme\n\n print("Hello World!")';

        _codeController = CodeController(
            text: source,
            language: languageSource,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else if (language == 'Python 3') {
        languageSource = python;
        languageType = 'python';
        source = '//Python 3 Programme\n\n print("Hello World!")';

        _codeController = CodeController(
            text: source,
            language: languageSource,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else if (language == 'Java') {
        languageSource = java;
        languageType = 'java';
        source =
            '//Java Programme\n\n class Java\n{\n public static void main(string[] args){\n\nSystem.out.println("Hello World!")\n\n}\n}';
        _codeController = CodeController(
            text: source,
            language: languageSource,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else if (language == 'Php') {
        languageSource = php;
        languageType = 'php';
        source = '//PHP Programme\n\n<?php\n\necho "Hello World!"\n\n?>';
        _codeController = CodeController(
            text: source,
            language: languageSource,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else if (language == 'Perl') {
        languageSource = perl;
        languageType = 'perl';
        source =
            '//Perl Programme\n\n#!/usr/bin/perl\n\n# Modules used\nuse strict;\nuse warnings;\n\nprint("Hello World\n");';

        _codeController = CodeController(
            text: source,
            language: languageSource,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else if (language == 'Scala') {
        languageSource = scala;
        languageType = 'scala';
        source =
            '//Scala Programme\n\nobject Geeks\n{\n// Main Method \ndef main(args: Array[String]) \n{\n println("Hello World!")\n}\n}';
        _codeController = CodeController(
            text: source,
            language: languageSource,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else {
        _codeController = CodeController(
          text: source,
          language: languageSource,
          theme: themesource,
          onChange: (val) {
            setState(() {
              source = val;
              compileRequestModel = CompileRequestModel(
                  language: languageType, code: source, input: "", save: true);
            });
          },
        );
      }

      _codeController = CodeController(
        text: source,
        language: languageSource,
        theme: themesource,
        onChange: (val) {
          setState(() {
            source = val;
            compileRequestModel = CompileRequestModel(
                language: languageType, code: source, input: "", save: true);
          });
        },
      );

      compileRequestModel = CompileRequestModel(
          language: languageType, code: source, input: "", save: true);

      setState(() {});
    }
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
    if (widget.languageItemEntity.id == 0) {
      // _codeController = CodeController(
      //     text: source, language: languageSource, theme: themesource);
      _codeController = CodeController(
          text: source,
          language: languageSource,
          theme: themesource,
          onChange: (value) {
            setState(() {
              source = value;
              compileRequestModel = CompileRequestModel(
                  language: languageType, code: source, input: "", save: true);
            });
          });
    } else if (widget.languageItemEntity.id == 100) {
      if (widget.languageItemEntity.language == 'Python') {
        favLanguage = python;
        languageType = 'python';
        source = widget.languageItemEntity.code!;
        _codeController = CodeController(
            text: source,
            language: favLanguage,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else if (widget.languageItemEntity.language == 'Java') {
        favLanguage = java;
        languageType = 'java';
        source = widget.languageItemEntity.code!;
        _codeController = CodeController(
            text: source,
            language: favLanguage,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else if (widget.languageItemEntity.language == 'Perl') {
        favLanguage = perl;
        languageType = 'perl';
        source = widget.languageItemEntity.code!;
        _codeController = CodeController(
            text: source,
            language: favLanguage,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else if (widget.languageItemEntity.language == 'Php') {
        favLanguage = php;
        languageType = 'php';
        source = widget.languageItemEntity.code!;
        _codeController = CodeController(
            text: source,
            language: favLanguage,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else if (widget.languageItemEntity.language == 'C++') {
        favLanguage = cpp;
        languageType = 'cpp';
        source = widget.languageItemEntity.code!;
        _codeController = CodeController(
            text: source,
            language: favLanguage,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else if (widget.languageItemEntity.language == 'Scala') {
        favLanguage = scala;
        languageType = 'scala';
        source = widget.languageItemEntity.code!;
        _codeController = CodeController(
            text: source,
            language: favLanguage,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else if (widget.languageItemEntity.language == 'Phthon 3') {
        favLanguage = python;
        languageType = 'python';
        source = widget.languageItemEntity.code!;
        _codeController = CodeController(
            text: source,
            language: favLanguage,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      } else {
        _codeController = CodeController(
            text: source,
            language: favLanguage,
            theme: themesource,
            onChange: (value) {
              setState(() {
                source = value;
                compileRequestModel = CompileRequestModel(
                    language: languageType,
                    code: source,
                    input: "",
                    save: true);
              });
            });
      }

      _codeController = CodeController(
        text: source,
        language: favLanguage,
        theme: themesource,
        onChange: (val) {
          setState(() {
            source = val;
            compileRequestModel = CompileRequestModel(
                language: languageType, code: source, input: "", save: true);
          });
        },
      );

      compileRequestModel = CompileRequestModel(
          language: languageType, code: source, input: "", save: true);
    }

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
    return Hero(
      tag: widget.isDirect ? 0 : widget.languageItemEntity.id,
      child: Scaffold(
        appBar: textEditorAppbar(),
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
                    padding:
                        EdgeInsets.only(bottom: widget.isDirect ? 0.0 : 6.0),
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
      ),
    );
  }

  AppBar textEditorAppbar() {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 3.0),
          child: CircleBbttonWidget(
            tap: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                      child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: fileController,
                            decoration: const InputDecoration(
                                hintText: 'File Name?',
                                border: InputBorder.none),
                          ),
                          ButtonWidget(
                            tap: () async {
                              if (fileController.text.isNotEmpty) {
                                DateTime currenttime = DateTime.now();
                                var ms = currenttime.microsecond;
                                LanguageItemEntity languageItemEntity =
                                    LanguageItemEntity(
                                        id: ms,
                                        title: fileController.text,
                                        imageAssets: "image assets",
                                        language: compileRequestModel.language
                                            .toUpperCase(),
                                        code: compileRequestModel.code,
                                        type: languageType);

                                BlocProvider.of<LocalCubitCubit>(context)
                                    .insertItem(languageItemEntity);
                                Navigator.of(context).pop();
                              }
                            },
                            child: const TextWidget(
                              title: 'Save',
                            ),
                            color: ColorTheme.primaryColor,
                          )
                        ],
                      ),
                    ),
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 115.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    //Contents here
                  ));
                },
              );
            },
            iconSize: Sizes.dimen_24,
            child: const Icon(EvaIcons.heartOutline),
            color: ColorTheme.redColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 3.0),
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
        widget.isDirect
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14.0, horizontal: 3.0),
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
                          changeLanguageSource('C++');

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
                          changeLanguageSource('Php');
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
              )
            : const SizedBox(),
        const SizedBox(
          width: 10.0,
        )
      ],
      // centerTitle: true,
      title: ButtonWidget(
        width: 55.0,
        color: Colors.blueGrey,
        tap: () {
          Navigator.pushNamed(context, RouteCons.complileRoute,
              arguments: compileRequestModel);
        },
        child: const TextWidget(
          color: ColorTheme.whiteColor,
          title: 'Play',
          size: Sizes.dimen_16,
        ),
      ),
      elevation: 0.0,
      backgroundColor: ColorTheme.primaryColor,
    );
  }
}
