import 'package:code_me/common/constants/pm_constants.dart';
import 'package:code_me/common/constants/size_constants.dart';
import 'package:code_me/domain/entities/language_item_entity.dart';
import 'package:code_me/presentations/pages/home_page/home_utils/list/language_list_widget.dart';
import 'package:code_me/presentations/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MyCodeBody extends StatelessWidget {
  const MyCodeBody({Key? key, required this.list}) : super(key: key);
  final List<LanguageItemEntity> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0),
      margin: const EdgeInsets.symmetric(horizontal: PMCons.normal),
      child: list.isNotEmpty
          ? SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: LanguageListWidget(languageList: list),
            )
          : const Center(
              child: TextWidget(
                title: 'No Item',
                color: Colors.red,
                size: Sizes.dimen_20,
              ),
            ),
    );
  }
}
