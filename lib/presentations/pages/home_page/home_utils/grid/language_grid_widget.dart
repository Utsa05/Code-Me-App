import 'package:code_me/common/constants/size_constants.dart';
import 'package:code_me/common/extensions/size_extensions.dart';
import 'package:code_me/domain/entities/language_item_entity.dart';
import 'package:code_me/presentations/pages/home_page/home_utils/grid/language_grid_item_widget.dart';
import 'package:flutter/material.dart';

class LanguageGridWidget extends StatelessWidget {
  const LanguageGridWidget({
    Key? key,
    required this.languageList,
  }) : super(key: key);

  final List<LanguageItemEntity> languageList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: languageList.length,
        shrinkWrap: true,
        primary: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.99999999999999,
            crossAxisSpacing: Sizes.dimen_14.w),
        itemBuilder: (context, index) {
          var item = languageList[index];
          return LanguageGridItemWidget(item: item);
        });
  }
}
