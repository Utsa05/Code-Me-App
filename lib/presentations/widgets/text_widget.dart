import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//normal text
class TextWidget extends StatelessWidget {
  const TextWidget(
      {Key? key,
      this.title,
      this.size,
      this.weight,
      this.color,
      this.line,
      this.overflow,
      this.align,
      this.height})
      : super(key: key);
  final String? title;
  final double? size;
  final FontWeight? weight;
  final TextAlign? align;
  final Color? color;
  final int? line;
  final TextOverflow? overflow;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? 'Title',
      maxLines: line ?? 1,
      overflow: overflow ?? TextOverflow.visible,
      textScaleFactor: height ?? 1.0,
      textAlign: align ?? TextAlign.start,
      style: GoogleFonts.openSans(
        color: color ?? ColorTheme.whiteColor,
        fontSize: size ?? 14.0,
        fontWeight: weight ?? FontWeight.normal,
      ),
    );
  }
}
