import 'package:code_me/common/constants/pm_constants.dart';
import 'package:code_me/common/constants/size_constants.dart';
import 'package:code_me/domain/entities/language_item_entity.dart';
import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:code_me/presentations/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class LanguageListItemWidget extends StatelessWidget {
  const LanguageListItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final LanguageItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(PMCons.min)),
        tileColor: ColorTheme.sceandaryColor,
        onTap: (() {}),
        title: TextWidget(
          title: item.title,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          size: 16.0,
          color: ColorTheme.whiteColor.withOpacity(0.4),
        ),
        leading: Image.asset(
          item.imageAssets,
          height: Sizes.dimen_30,
        ),
      ),
    );
  }
}
