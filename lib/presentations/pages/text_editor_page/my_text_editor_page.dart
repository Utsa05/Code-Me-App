// ignore_for_file: avoid_print

import 'package:code_me/common/constants/code_constants.dart';
import 'package:code_me/common/constants/route_constants.dart';
import 'package:code_me/common/constants/size_constants.dart';
import 'package:code_me/data/core/code_help_item.dart';
import 'package:code_me/data/models/compile_request_model.dart';
import 'package:code_me/domain/entities/language_item_entity.dart';
import 'package:code_me/presentations/cubits/localCubit/local_cubit_cubit.dart';
import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:code_me/presentations/widgets/button_widget.dart';
import 'package:code_me/presentations/widgets/text_widget.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_highlight/themes/default.dart';
import 'package:flutter_highlight/themes/gradient-dark.dart';
import 'package:flutter_highlight/themes/lightfair.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlight/languages/cpp.dart';
import 'package:highlight/languages/python.dart';
import 'package:highlight/languages/java.dart';
import 'package:highlight/languages/php.dart';
import 'package:highlight/languages/perl.dart';
import 'package:highlight/languages/scala.dart';
import 'text_editor_utils/need_classes.dart';

class MyTextEditorPage extends StatefulWidget {
  const MyTextEditorPage({Key? key, required this.languageItemEntity})
      : super(key: key);
  final LanguageItemEntity languageItemEntity;

  @override
  State<MyTextEditorPage> createState() => _MyTextEditorPageState();
}

class _MyTextEditorPageState extends State<MyTextEditorPage> {
  final TextEditingController fileController = TextEditingController();
  //for editor
  CodeController? _codeController;
  Map<String, TextStyle> themeSelected = monokaiSublimeTheme;
  var languageSelected = cpp;
  var codeSelected = CodeCons.cppCode;
  var langeugaeSelectedType = "Cpp";
  var assetsString = 'assets/icons/cpp.png';
  late CompileRequestModel compileRequestModel;

  @override
  void initState() {
    print(widget.languageItemEntity.page);
    print('language:' + widget.languageItemEntity.language.toString());

    setValuePageWise();
    super.initState();
  }

  setValuePageWise() {
    if (widget.languageItemEntity.page == 'nav') {
      setControllerDefalutValue();
    } else if (widget.languageItemEntity.page == 'save') {
      setLanguageForSave(
          language: widget.languageItemEntity.language.toLowerCase());
    } else {
      setLanguageOnly(
          language: widget.languageItemEntity.language.toLowerCase());
    }

    setState(() {});
  }

  setLanguageForSave({required String language}) {
    if (language.toLowerCase() == 'cpp') {
      languageSelected = cpp;
      langeugaeSelectedType = 'Cpp';
      assetsString = 'assets/icons/cpp.png';
      codeSelected = widget.languageItemEntity.code!;
    } else if (language.toLowerCase() == 'python') {
      languageSelected = python;
      langeugaeSelectedType = 'Python';
      assetsString = 'assets/icons/python.png';
      codeSelected = widget.languageItemEntity.code!;
    } else if (language.toLowerCase() == 'python 3') {
      languageSelected = python;
      langeugaeSelectedType = 'Python 3';
      assetsString = 'assets/icons/python.png';
      codeSelected = widget.languageItemEntity.code!;
    } else if (language.toLowerCase() == 'java') {
      languageSelected = java;
      langeugaeSelectedType = 'Java';
      assetsString = 'assets/icons/java.png';
      codeSelected = widget.languageItemEntity.code!;
    } else if (language.toLowerCase() == 'php') {
      languageSelected = php;
      langeugaeSelectedType = 'Php';
      assetsString = 'assets/icons/php.png';
      codeSelected = widget.languageItemEntity.code!;
    } else if (language.toLowerCase() == 'perl') {
      languageSelected = perl;
      langeugaeSelectedType = 'Perl';
      assetsString = 'assets/icons/python.png';
      codeSelected = widget.languageItemEntity.code!;
    } else if (language.toLowerCase() == 'scala') {
      languageSelected = scala;
      langeugaeSelectedType = 'Scala';
      assetsString = 'assets/icons/python.png';
      codeSelected = widget.languageItemEntity.code!;
    }
    setControllerDefalutValue();
  }

  setLanguageOnly({required String language}) {
    if (language.toLowerCase() == 'cpp') {
      languageSelected = cpp;
      langeugaeSelectedType = 'Cpp';
      assetsString = 'assets/icons/cpp.png';
      codeSelected = CodeCons.cppCode;
    } else if (language.toLowerCase() == 'python') {
      languageSelected = python;
      langeugaeSelectedType = 'Python';
      assetsString = 'assets/icons/python.png';
      codeSelected = CodeCons.pythonCode;
    } else if (language.toLowerCase() == 'python 3') {
      languageSelected = python;
      langeugaeSelectedType = 'Python 3';
      assetsString = 'assets/icons/python.png';
      codeSelected = CodeCons.pythonCode;
    } else if (language.toLowerCase() == 'java') {
      languageSelected = java;
      langeugaeSelectedType = 'Java';
      assetsString = 'assets/icons/java.png';
      codeSelected = CodeCons.javaCode;
    } else if (language.toLowerCase() == 'php') {
      languageSelected = php;
      langeugaeSelectedType = 'Php';
      assetsString = 'assets/icons/php.png';
      codeSelected = CodeCons.phpCode;
    } else if (language.toLowerCase() == 'perl') {
      languageSelected = perl;
      langeugaeSelectedType = 'Perl';
      assetsString = 'assets/icons/python.png';
      codeSelected = CodeCons.perlCode;
    } else if (language.toLowerCase() == 'scala') {
      languageSelected = scala;
      langeugaeSelectedType = 'Scala';
      assetsString = 'assets/icons/python.png';
      codeSelected = CodeCons.scalaCode;
    }
    setControllerDefalutValue();
  }

  setControllerDefalutValue() {
    compileRequestModel = CompileRequestModel(
        page: widget.languageItemEntity.page,
        id: widget.languageItemEntity.id,
        imagess: assetsString,
        fileName: fileController.text,
        code: codeSelected,
        input: '',
        save: true,
        language: langeugaeSelectedType);

    _codeController = CodeController(
        onChange: (code) {
          codeSelected = code;
          compileRequestModel = CompileRequestModel(
              code: codeSelected,
              input: '',
              save: true,
              language: langeugaeSelectedType);
        },
        language: languageSelected,
        theme: themeSelected,
        text: codeSelected);

    setState(() {});
  }

  changeTheme(String theme) {
    if (theme == 'Default') {
      themeSelected = monokaiSublimeTheme;
    } else if (theme == 'Lightfair') {
      themeSelected = lightfairTheme;
    } else if (theme == 'Gradient Dark') {
      themeSelected = gradientDarkTheme;
    } else {
      themeSelected = defaultTheme;
    }

    setControllerDefalutValue();

    setState(() {});
  }

  //extra method
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
                  padding: EdgeInsets.only(
                      bottom:
                          widget.languageItemEntity.page == 'nav' ? 0.0 : 6.0),
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

  AppBar textEditorAppbar() {
    return AppBar(
      actions: [
        widget.languageItemEntity.page != 'save'
            ? Padding(
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
                                              imageAssets: assetsString,
                                              language:
                                                  compileRequestModel.language,
                                              code: compileRequestModel.code,
                                              page: 'save',
                                              type: compileRequestModel.language
                                                  .toLowerCase());

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
              )
            : const SizedBox(),
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
                    changeTheme('Default');
                    break;
                  case ThemeMenuItems.light:
                    changeTheme('Light');
                    //Do something
                    break;
                  case ThemeMenuItems.gradidark:
                    changeTheme('Gradient Dark');
                    //Do something
                    break;
                  case ThemeMenuItems.lightfair:
                    changeTheme('Lightfair');
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
        widget.languageItemEntity.page == 'nav'
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
                          setLanguageOnly(language: 'cpp');

                          break;
                        case LanguageMenuItems.python:
                          setLanguageOnly(language: 'Python');
                          break;
                        case LanguageMenuItems.python3:
                          setLanguageOnly(language: 'Python 3');
                          //Do something
                          break;
                        case LanguageMenuItems.java:
                          setLanguageOnly(language: 'Java');
                          //Do something
                          break;
                        case LanguageMenuItems.php:
                          setLanguageOnly(language: 'Php');
                          //Do something
                          break;

                        case LanguageMenuItems.perl:
                          setLanguageOnly(language: 'Perl');
                          //Do something
                          break;

                        case LanguageMenuItems.scala:
                          setLanguageOnly(language: 'Scala');
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
      title: BlocListener<LocalCubitCubit, LocalCubitState>(
        listener: (context, state) {
          var fTitle = '';
          if (state is FetchedLanguageState) {
            if (widget.languageItemEntity.page == 'save') {
              for (var item in state.languageList) {
                if (item.id == widget.languageItemEntity.id) {
                  //delete first
                  setState(() {
                    fTitle = item.title;
                  });

                  print(fTitle);

                  BlocProvider.of<LocalCubitCubit>(context)
                      .deleteItem(widget.languageItemEntity);

                  LanguageItemEntity languageItemEntity = LanguageItemEntity(
                      id: widget.languageItemEntity.id,
                      title: fTitle,
                      imageAssets: assetsString,
                      language: compileRequestModel.language,
                      code: compileRequestModel.code,
                      page: 'save',
                      type: compileRequestModel.language.toLowerCase());

                  BlocProvider.of<LocalCubitCubit>(context)
                      .insertItem(languageItemEntity);
                  BlocProvider.of<LocalCubitCubit>(context)
                      .fetchLanguages('nosearch');
                }
              }
            }
          }
        },
        child: ButtonWidget(
          width: 55.0,
          color: Colors.blueGrey,
          tap: () {
            BlocProvider.of<LocalCubitCubit>(context)
                .fetchLanguages('nosearch');
            // print(compileRequestModel.language);
            // print(compileRequestModel.code);
            Navigator.pushNamed(context, RouteCons.complileRoute,
                arguments: compileRequestModel);
          },
          child: const TextWidget(
            color: ColorTheme.whiteColor,
            title: 'Play',
            size: Sizes.dimen_16,
          ),
        ),
      ),
      elevation: 0.0,
      backgroundColor: ColorTheme.primaryColor,
    );
  }
}
