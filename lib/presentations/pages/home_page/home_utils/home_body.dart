import 'package:code_me/common/constants/pm_constants.dart';
import 'package:code_me/common/constants/size_constants.dart';

import 'package:code_me/data/core/langulage_item_list.dart';
import 'package:code_me/domain/entities/language_item_entity.dart';
import 'package:code_me/presentations/pages/home_page/home_utils/grid/language_grid_widget.dart';

import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool isGrid = true;

  void changeItemType() {
    setState(() {
      isGrid = !isGrid;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<LanguageItemEntity> languageList =
        LanguageItemList().getLanguageItemList();
    return Column(
      children: [
        // HeaderButtonWidget(
        //   title: 'Languages',
        //   isGrid: isGrid,
        //   isIconVisible: true,
        //   tap: changeItemType,
        // ),
        const SizedBox(
          height: Sizes.dimen_12,
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: PMCons.normal),
              child: LanguageGridWidget(languageList: languageList),
              //isGrid
              //     ? LanguageGridWidget(languageList: languageList)
              //     : LanguageListWidget(languageList: languageList),
            ),
          ),
        )
      ],
    );
  }
}
