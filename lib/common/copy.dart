import 'package:clipboard/clipboard.dart';
import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:code_me/presentations/widgets/text_widget.dart';
import 'package:flutter/material.dart';

void copyText(String text) {
  FlutterClipboard.copy(text).then((value) {
    const SnackBar(
        backgroundColor: ColorTheme.primaryColor,
        content: TextWidget(
          color: ColorTheme.whiteColor,
          title: 'Copid Successfully',
        ));
  });
}
