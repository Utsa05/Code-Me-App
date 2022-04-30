import 'package:code_me/common/constants/pm_constants.dart';
import 'package:code_me/common/constants/route_constants.dart';
import 'package:code_me/common/constants/size_constants.dart';
import 'package:code_me/domain/entities/language_item_entity.dart';
import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:code_me/presentations/widgets/button_widget.dart';
import 'package:code_me/presentations/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class LanguageGridItemWidget extends StatelessWidget {
  const LanguageGridItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final LanguageItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: item.id,
      child: Container(
        margin: const EdgeInsets.only(bottom: PMCons.min + 5.0),
        child: ButtonWidget(
          elevaiton: 0.0,
          radius: PMCons.normal,
          tap: () {
            Navigator.pushNamed(context, RouteCons.texteditorRoue,
                arguments: item);
          },
          color: ColorTheme.sceandaryColor,
          child: Padding(
            padding: const EdgeInsets.all(PMCons.large),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  item.imageAssets,
                  height: Sizes.dimen_60,
                ),
                const SizedBox(
                  height: Sizes.dimen_14,
                ),
                TextWidget(
                  title: item.title,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
