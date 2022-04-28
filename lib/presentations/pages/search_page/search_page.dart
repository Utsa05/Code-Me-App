import 'package:code_me/common/constants/pm_constants.dart';

import 'package:code_me/presentations/pages/search_page/search_utils/search_body.dart';
import 'package:code_me/presentations/pages/search_page/search_utils/search_widget.dart';
import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: PMCons.no,
        backgroundColor: ColorTheme.primaryColor,
        title: ClipRRect(
          borderRadius: BorderRadius.circular(PMCons.min),
          child: SearchBarWidget(searchController: _searchController),
        ),
      ),
      body: const SearchBody(),
    );
  }
}
