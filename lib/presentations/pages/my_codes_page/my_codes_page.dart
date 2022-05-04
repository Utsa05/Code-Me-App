import 'package:code_me/common/constants/pm_constants.dart';
import 'package:code_me/common/constants/size_constants.dart';
import 'package:code_me/presentations/cubits/localCubit/local_cubit_cubit.dart';
import 'package:code_me/presentations/pages/my_codes_page/mycode_util/my_codes_body.dart';
import 'package:code_me/presentations/pages/search_page/search_utils/search_widget.dart';
import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:code_me/presentations/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCodesPage extends StatefulWidget {
  const MyCodesPage({Key? key}) : super(key: key);

  @override
  State<MyCodesPage> createState() => _MyCodesPageState();
}

class _MyCodesPageState extends State<MyCodesPage> {
  LocalCubitCubit get localcubt => BlocProvider.of<LocalCubitCubit>(context);

  @override
  void initState() {
    localcubt.fetchLanguages('nosearch');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.0,
        elevation: PMCons.no,
        backgroundColor: ColorTheme.primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TextWidget(
              color: ColorTheme.blueColor,
              title: "Codes",
              size: Sizes.dimen_20,
            ),
            const SizedBox(
              height: Sizes.dimen_8,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(PMCons.min),
              child: SizedBox(
                  height: 48.0,
                  child: SearchBarWidget(searchController: _searchController)),
            ),
          ],
        ),
      ),
      body: BlocBuilder<LocalCubitCubit, LocalCubitState>(
        builder: (context, state) {
          if (state is FetchedLanguageState) {
            return MyCodeBody(
              list: state.languageList,
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: ColorTheme.blueColor,
            ),
          );
        },
      ),
    );
  }
}
