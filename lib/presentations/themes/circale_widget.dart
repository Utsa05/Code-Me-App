import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:flutter/material.dart';

class CircaleWidget extends StatelessWidget {
  const CircaleWidget({Key? key, this.child, this.size, this.color})
      : super(key: key);
  final Widget? child;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color ?? ColorTheme.sceandaryColor,
      radius: size ?? 25.0,
      child: child ?? const Icon(Icons.emoji_emotions),
    );
  }
}
