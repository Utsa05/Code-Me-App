// ignore_for_file: avoid_print

import 'dart:async';

import 'package:code_me/common/constants/size_constants.dart';

import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:code_me/presentations/widgets/button_widget.dart';
import 'package:code_me/presentations/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RunCodePage extends StatefulWidget {
  const RunCodePage({Key? key}) : super(key: key);

  @override
  State<RunCodePage> createState() => _RunCodePageState();
}

class _RunCodePageState extends State<RunCodePage> {
  final TextEditingController inputController = TextEditingController();
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
                        radius: 100,
                        width: 35.0,
                        height: 55.0,
                        elevaiton: 0.0,
                        color: ColorTheme.blueColor.withOpacity(0.2),
                        tap: () async {
                          outputBottomsheetMethod(context);
                        },
                        child: const Icon(
                          Icons.play_arrow_outlined,
                          color: ColorTheme.blueColor,
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

  Future<dynamic> outputBottomsheetMethod(BuildContext context) {
    return showModalBottomSheet(
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
                            child: const TextWidget(
                                line: 50,
                                title:
                                    "Congress! Your programme Successfully compiled and output is equal to your target\n memory: 2kb and TimCongress! "),
                            padding: const EdgeInsets.all(8.0),
                            color: ColorTheme.sceandaryColor,
                          ),
                        ),
                      ),
                    )),
                    const SizedBox(
                      height: Sizes.dimen_14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        TextWidget(
                          title: 'Memory: 12.4',
                          color: ColorTheme.redColor,
                        ),
                        TextWidget(
                          title: 'Time: 2s',
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
