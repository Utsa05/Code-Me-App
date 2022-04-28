import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:code_me/presentations/widgets/text_widget.dart';
import 'package:flutter/material.dart';

//normal button
class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key,
      this.width,
      this.height,
      this.color,
      this.child,
      this.radius,
      required this.tap,
      this.splashColor,
      this.elevaiton})
      : super(key: key);
  final double? width;
  final double? height;
  final Color? color;
  final Widget? child;
  final double? radius;
  final GestureTapCallback tap;
  final Color? splashColor;
  final double? elevaiton;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: elevaiton ?? 3.0,
      splashColor: splashColor ?? ColorTheme.whiteColor,
      minWidth: width ?? 80.0,
      height: height ?? 30.0,
      child: child ??
          const TextWidget(
            title: 'Button',
          ),
      color: color ?? ColorTheme.blueColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 5.0)),
      onPressed: tap,
      onLongPress: tap,
    );
  }
}

//cicular button
class CircleBbttonWidget extends StatelessWidget {
  const CircleBbttonWidget({
    Key? key,
    this.iconSize,
    this.splashRadiurs,
    this.color,
    this.child,
    required this.tap,
    this.splashColor,
  }) : super(key: key);
  final double? iconSize;
  final double? splashRadiurs;
  final Color? color;
  final Widget? child;
  final GestureTapCallback tap;
  final Color? splashColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: splashColor ?? ColorTheme.whiteColor,
      splashRadius: splashRadiurs ?? 20.0,
      iconSize: iconSize ?? 15.0,
      icon: child ?? const Icon(Icons.emoji_emotions),
      color: color ?? ColorTheme.blueColor,
      onPressed: tap,
    );
  }
}
