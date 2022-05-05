import 'package:code_me/common/constants/pm_constants.dart';
import 'package:code_me/common/constants/size_constants.dart';
import 'package:code_me/domain/entities/language_item_entity.dart';
import 'package:code_me/presentations/cubits/localCubit/local_cubit_cubit.dart';
import 'package:code_me/presentations/pages/text_editor_page/my_text_editor_page.dart';
import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:code_me/presentations/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        contentPadding: const EdgeInsets.only(
            right: 0.0, left: 16.0, top: 4.0, bottom: 4.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(PMCons.min)),
        tileColor: ColorTheme.sceandaryColor,
        onTap: (() {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) =>
                      MyTextEditorPage(languageItemEntity: item)));
          // Navigator.pushNamed(context, RouteCons.texteditorRoue,
          //     arguments: item);
        }),
        title: TextWidget(
          line: 1,
          title: item.title,
        ),
        trailing: IconButton(
            //padding: const EdgeInsets.all(0.0),
            splashRadius: 20.0,
            onPressed: () async {
              BlocProvider.of<LocalCubitCubit>(context).deleteItem(item);
              BlocProvider.of<LocalCubitCubit>(context)
                  .fetchLanguages('nosearch');
            },
            icon: const Icon(
              Icons.delete_outline_outlined,
              color: ColorTheme.redColor,
            )),
        leading: Image.asset(
          item.imageAssets,
          height: Sizes.dimen_30,
        ),
      ),
    );
  }
}
