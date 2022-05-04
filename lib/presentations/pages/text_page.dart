// import 'package:code_me/presentations/themes/color_theme.dart';
// import 'package:code_text_field/code_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_highlight/themes/monokai-sublime.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:highlight/languages/cpp.dart';

// class TextPage extends StatefulWidget {
//   const TextPage({Key? key}) : super(key: key);

//   @override
//   State<TextPage> createState() => _TextPageState();
// }

// class _TextPageState extends State<TextPage> {
//   CodeController? _codeController;
//   var source =
//       '//c++ programme\n\n #include<bits/stdc++.h>\nusing namespace std;\n\n//your main function\nint main()\n{\ncout <<"Hello World!";	\n\nreturn 0;\n}\n';
//   @override
//   void initState() {
//     _codeController = CodeController(
//         text: source,
//         language: cpp,
//         theme: monokaiSublimeTheme,
//         onChange: (value) {
//           setState(() {
//             source = value;
//           });
//         });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(10.0),
//           child: SingleChildScrollView(
//             physics: const ScrollPhysics(),
//             child: CodeField(
//               maxLines: 25,
//               controller: _codeController!,
//               textStyle: GoogleFonts.openSans(),
//             ),
//           ),
//         ),
//         MaterialButton(
//           onPressed: () {
//             print(source);
//           },
//           color: ColorTheme.redColor,
//         )
//       ],
//     );
//   }
// }
