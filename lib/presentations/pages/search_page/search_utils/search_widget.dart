import 'package:code_me/common/constants/pm_constants.dart';
import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:code_me/presentations/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    Key? key,
    required TextEditingController searchController,
  })  : _searchController = searchController,
        super(key: key);

  final TextEditingController _searchController;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  bool isWriting = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          controller: widget._searchController,
          onChanged: (value) {
            if (value.isNotEmpty) {
              isWriting = true;
            } else {
              isWriting = false;
            }

            setState(() {});
          },
          style: const TextStyle(color: ColorTheme.blueColor),
          decoration: const InputDecoration(
              labelStyle: TextStyle(color: ColorTheme.blueColor),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              fillColor: ColorTheme.sceandaryColor,
              filled: true,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintStyle: TextStyle(color: ColorTheme.whiteColor),
              contentPadding: EdgeInsets.only(
                  left: 15, bottom: 11, top: 11, right: PMCons.max + 20.0),
              hintText: "Search"),
        ),
        isWriting
            ? Align(
                alignment: Alignment.centerRight,
                child: CircleBbttonWidget(
                  splashColor: ColorTheme.blueColor,
                  tap: () {
                    widget._searchController.clear();
                    if (widget._searchController.text.isNotEmpty) {
                      isWriting = true;
                    } else {
                      isWriting = false;
                    }

                    setState(() {});
                  },
                  iconSize: 25.0,
                  color: ColorTheme.redColor,
                  child: const Icon(Icons.close),
                ))
            : const SizedBox()
      ],
    );
  }
}
