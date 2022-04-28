import 'package:code_me/common/constants/size_constants.dart';
import 'package:code_me/presentations/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlight/languages/dart.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';

class TextEditorBody extends StatefulWidget {
  const TextEditorBody({Key? key}) : super(key: key);

  @override
  State<TextEditorBody> createState() => _TextEditorBodyState();
}

class _TextEditorBodyState extends State<TextEditorBody> {
  CodeController? _codeController;

  @override
  void initState() {
    super.initState();
    const source = "void main() {\n    print(\"Hello, world!\");\n}";
    // Instantiate the CodeController
    _codeController = CodeController(
      text: source,
      language: dart,
      theme: monokaiSublimeTheme,
    );
  }

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: Sizes.dimen_6, vertical: Sizes.dimen_4),
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: CodeField(
                  maxLines: 21,
                  controller: _codeController!,
                  textStyle: GoogleFonts.openSans(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [ButtonWidget(tap: () {})],
            ),
          )
        ],
      ),
    );
  }
}
