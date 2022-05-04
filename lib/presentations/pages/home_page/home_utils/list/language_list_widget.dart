import 'package:code_me/domain/entities/language_item_entity.dart';
import 'package:code_me/presentations/pages/home_page/home_utils/list/language_list_item_widget.dart';
import 'package:flutter/material.dart';

class LanguageListWidget extends StatelessWidget {
  const LanguageListWidget({
    Key? key,
    required this.languageList,
  }) : super(key: key);

  final List<LanguageItemEntity> languageList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: languageList.length,
        itemBuilder: (context, index) {
          var item = languageList[index];

          return LanguageListItemWidget(item: item);
        });
  }
}
