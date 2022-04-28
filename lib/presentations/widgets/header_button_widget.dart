import 'package:code_me/common/constants/pm_constants.dart';
import 'package:code_me/common/constants/size_constants.dart';
import 'package:code_me/common/extensions/size_extensions.dart';
import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:code_me/presentations/widgets/button_widget.dart';
import 'package:code_me/presentations/widgets/text_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class HeaderButtonWidget extends StatelessWidget {
  const HeaderButtonWidget({
    Key? key,
    required this.isGrid,
    this.title,
    this.titleColor,
    this.iconData,
    this.iconColor,
    this.tap,
    this.isIconVisible,
    this.titleSize,
    this.titleWieght,
  }) : super(key: key);
  final bool isGrid;
  final bool? isIconVisible;
  final String? title;
  final Color? titleColor;
  final IconData? iconData;
  final Color? iconColor;
  final GestureTapCallback? tap;
  final double? titleSize;
  final FontWeight? titleWieght;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: PMCons.normal, right: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(
            title: title,
            size: titleSize ?? Sizes.dimen_10.h + 2.0,
            color: titleColor ?? ColorTheme.blueColor,
            weight: titleWieght ?? FontWeight.normal,
          ),
          isIconVisible == true
              ? CircleBbttonWidget(
                  color: ColorTheme.blueColor,
                  child: isGrid == true || isGrid == false
                      ? Icon(
                          isGrid ? EvaIcons.listOutline : EvaIcons.undoOutline,
                          size: Sizes.dimen_24 + 3.0,
                        )
                      : Icon(
                          iconData ?? Icons.arrow_drop_down,
                          color: iconColor ?? ColorTheme.whiteColor,
                        ),
                  tap: tap!)
              : const SizedBox(),
        ],
      ),
    );
  }
}
