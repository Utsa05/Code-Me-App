import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget(
      {Key? key,
      this.child,
      this.color,
      this.radiusAll,
      this.boxDecoration,
      this.width,
      this.height,
      this.alignment})
      : super(key: key);
  final Widget? child;
  final double? width;
  final double? height;
  final Color? color;
  final double? radiusAll;
  final BoxDecoration? boxDecoration;
  final Alignment? alignment;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.0,
      width: width ?? 90.0,
      alignment: alignment ?? Alignment.center,
      child: child,
      decoration: BoxDecoration(
        color: color ?? ColorTheme.whiteColor,
        borderRadius: BorderRadius.circular(radiusAll ?? 0.0),
      ),
    );
  }
}
