import 'package:code_me/common/constants/pm_constants.dart';
import 'package:code_me/data/core/langulage_item_list.dart';
import 'package:code_me/presentations/pages/home_page/home_utils/list/language_list_widget.dart';
import 'package:flutter/widgets.dart';

class MyCodeBody extends StatelessWidget {
  const MyCodeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0),
      margin: const EdgeInsets.symmetric(horizontal: PMCons.normal),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: LanguageListWidget(
            languageList: LanguageItemList().getLanguageItemList()),
      ),
    );
  }
}
