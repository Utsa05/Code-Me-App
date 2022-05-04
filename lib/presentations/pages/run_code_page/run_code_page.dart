// ignore_for_file: avoid_print

import 'dart:async';

import 'package:code_me/common/constants/size_constants.dart';
import 'package:code_me/data/models/compile_output_model.dart';
import 'package:code_me/data/models/compile_request_model.dart';
import 'package:code_me/data/models/compile_response_model.dart';
import 'package:code_me/domain/entities/language_item_entity.dart';
import 'package:code_me/presentations/cubits/CompileRequestCubit/compilerequest_cubit.dart';
import 'package:code_me/presentations/cubits/localCubit/local_cubit_cubit.dart';

import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:code_me/presentations/widgets/button_widget.dart';
import 'package:code_me/presentations/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RunCodePage extends StatefulWidget {
  const RunCodePage({Key? key, required this.compileModel}) : super(key: key);
  final CompileRequestModel compileModel;

  @override
  State<RunCodePage> createState() => _RunCodePageState();
}

class _RunCodePageState extends State<RunCodePage> {
  final TextEditingController inputController = TextEditingController();
  late String code, language, input;

  @override
  void initState() {
    super.initState();
    setCompilerInfo();

    print(language);
    print(widget.compileModel.page);
    print(widget.compileModel.code);
    print(widget.compileModel.fileName);
    //print(input??"uu");
  }

  void setCompilerInfo() {
    setState(() {
      code = widget.compileModel.code;
      language = widget.compileModel.language;
    });
  }

  bool isLoading = false;

  late CompileResponseModel response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const SizedBox(
          height: 60.0,
          child: Padding(
            padding: EdgeInsets.only(bottom: 0.0),
            child: Placeholder(),
          )),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorTheme.primaryColor,
        title: const TextWidget(
          color: ColorTheme.blueColor,
          title: 'Compile Here',
          size: Sizes.dimen_16,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.dimen_14, vertical: Sizes.dimen_8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: TextField(
                  minLines: 18,
                  style: GoogleFonts.openSans(color: ColorTheme.redColor),
                  maxLines: 20,
                  controller: inputController,
                  decoration: InputDecoration(
                      hintStyle:
                          GoogleFonts.openSans(color: ColorTheme.whiteColor),
                      hintText: "Programme Input",
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      fillColor: ColorTheme.sceandaryColor,
                      filled: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonWidget(
                        radius: 100,
                        width: 35.0,
                        height: 55.0,
                        elevaiton: 0.0,
                        color: ColorTheme.whiteColor.withOpacity(0.1),
                        tap: () {},
                        child: Icon(
                          Icons.copy_sharp,
                          color: ColorTheme.whiteColor.withOpacity(0.6),
                        )),
                    ButtonWidget(
                        radius: 200.0,
                        width: 35.0,
                        height: 55.0,
                        elevaiton: 0.0,
                        color: ColorTheme.blueColor.withOpacity(0.2),
                        tap: () async {
                          var model = CompileRequestModel(
                              language: language.toLowerCase(),
                              code: code,
                              input: inputController.text,
                              save: true);

                          if (model.language.isEmpty || model.code.isEmpty) {
                            print('field cannot be empty');
                          } else {
                            // if (widget.compileModel.page == 'save') {
                            //   LanguageItemEntity languageItemEntity =
                            //       LanguageItemEntity(
                            //           id: widget.compileModel.id!,
                            //           imageAssets: '',
                            //           title: '',
                            //           language: '',
                            //           type: '');
                            // BlocProvider.of<LocalCubitCubit>(context)
                            //     .deleteItem(languageItemEntity);
                            //   DateTime currenttime = DateTime.now();
                            //   var ms = currenttime.microsecond;
                            //   LanguageItemEntity languageItem =
                            //       LanguageItemEntity(
                            //           id: ms,
                            //           title: "updated",
                            //           imageAssets: widget.compileModel.imagess!,
                            //           language: widget.compileModel.language,
                            //           code: code,
                            //           page: 'save',
                            //           type: widget.compileModel.language
                            //               .toLowerCase());

                            //   BlocProvider.of<LocalCubitCubit>(context)
                            //       .insertItem(languageItem);
                            //   BlocProvider.of<LocalCubitCubit>(context)
                            //       .fetchLanguages('nosearch');
                            // }

                            setState(() {
                              isLoading = true;
                            });

                            //request to compile
                            BlocProvider.of<CompilerequestCubit>(context,
                                    listen: false)
                                .initiateCompileRequest(model);

                            // outputBottomsheetMethod(context, response);

                          }
                          //
                        },
                        child: BlocListener<CompilerequestCubit,
                            CompilerequestState>(
                          listener: (context, state) {
                            if (state is CompilerequestLoading) {
                              setState(() {
                                isLoading = true;
                              });
                            } else if (state is OutputResponseStage) {
                              setState(() {
                                isLoading = false;
                              });

                              if (state.compileOutputModel.status ==
                                  "SUCCESS") {
                                Timer(const Duration(seconds: 1), () {
                                  outputBottomsheetMethod(
                                      context, state.compileOutputModel);
                                });
                              } else {
                                print('no output');
                              }
                            }
                          },
                          child: isLoading == false
                              ? const Icon(
                                  Icons.play_arrow_outlined,
                                  color: ColorTheme.blueColor,
                                )
                              : const SizedBox(
                                  height: 20.0,
                                  width: 20.0,
                                  child: CircularProgressIndicator(
                                    color: ColorTheme.redColor,
                                  ),
                                ),
                        )),
                    ButtonWidget(
                        radius: 100,
                        width: 35.0,
                        height: 55.0,
                        elevaiton: 0.0,
                        color: ColorTheme.whiteColor.withOpacity(0.1),
                        tap: () {},
                        child: Icon(
                          Icons.share_outlined,
                          color: ColorTheme.whiteColor.withOpacity(0.6),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> outputBottomsheetMethod(
      BuildContext context, CompileOutputModel model) {
    return showModalBottomSheet(
        isDismissible: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, left: 15.0, right: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const TextWidget(
                          title: 'Output',
                          size: Sizes.dimen_14 + 2.0,
                          color: ColorTheme.blueColor,
                        ),
                        CircleBbttonWidget(
                            color: ColorTheme.whiteColor,
                            iconSize: 27.0,
                            child: const Icon(
                              Icons.close,
                              color: ColorTheme.whiteColor,
                            ),
                            tap: () {
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: SingleChildScrollView(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8.0),
                            color: ColorTheme.sceandaryColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(line: 50, title: model.output),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: TextWidget(
                                      line: 50, title: model.rntError),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                    const SizedBox(
                      height: Sizes.dimen_14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          title: 'Memory(mb):  ${model.memory.toString()}',
                          color: ColorTheme.redColor,
                        ),
                        TextWidget(
                          title: 'Time(sec): ${model.time.toString()}',
                          color: ColorTheme.successColor,
                        )
                      ],
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: ColorTheme.primaryColor),
              height: MediaQuery.of(context).size.height * 6,
            ),
          );
        });
  }
}
