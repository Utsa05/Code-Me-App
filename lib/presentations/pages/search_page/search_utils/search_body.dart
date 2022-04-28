import 'package:code_me/common/constants/pm_constants.dart';
import 'package:code_me/common/constants/size_constants.dart';
import 'package:code_me/data/core/langulage_item_list.dart';
import 'package:code_me/presentations/pages/home_page/home_utils/grid/language_grid_widget.dart';
import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:code_me/presentations/widgets/header_button_widget.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      // padding: const EdgeInsets.symmetric(horizontal: PMCons.min + 3.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: Sizes.dimen_10,
            ),
            const HeaderButtonWidget(
              titleColor: ColorTheme.whiteColor,
              title: 'Popular',
              titleWieght: FontWeight.bold,
              titleSize: Sizes.dimen_20 - 2.0,
              isGrid: false,
              isIconVisible: false,
            ),
            const SizedBox(
              height: Sizes.dimen_12,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: PMCons.min + 3.0),
              child: LanguageGridWidget(
                  languageList: LanguageItemList().getLanguageItemList()),
            ),
            const SizedBox(
              height: Sizes.dimen_10,
            ),
            const HeaderButtonWidget(
              titleColor: ColorTheme.whiteColor,
              title: 'Recent',
              titleWieght: FontWeight.bold,
              titleSize: Sizes.dimen_20 - 2.0,
              isGrid: false,
              isIconVisible: false,
            ),
            const SizedBox(
              height: Sizes.dimen_12,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: PMCons.min + 3.0),
              child: LanguageGridWidget(
                  languageList: LanguageItemList().getLanguageItemList()),
            ),
          ],
        ),
      ),
    );
  }
}
