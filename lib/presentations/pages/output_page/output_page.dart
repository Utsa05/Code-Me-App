import 'package:code_me/common/constants/size_constants.dart';
import 'package:code_me/data/models/compile_output_model.dart';
import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:code_me/presentations/widgets/button_widget.dart';
import 'package:code_me/presentations/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class OutputPage extends StatelessWidget {
  const OutputPage({Key? key, required this.outputModel}) : super(key: key);
  final CompileOutputModel outputModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorTheme.primaryColor,
        title: const TextWidget(
          color: ColorTheme.blueColor,
          title: 'Output',
          size: Sizes.dimen_16,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 20.0, left: 15.0, right: 15.0),
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
      ),
    );
  }
}
