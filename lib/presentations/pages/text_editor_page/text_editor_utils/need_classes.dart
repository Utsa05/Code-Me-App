import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class LanguageItem {
  final String text;
  final String image;

  const LanguageItem({
    required this.text,
    required this.image,
  });
}

class LanguageMenuItems {
  static const List<LanguageItem> firstItems = [
    cpp,
    python,
    python3,
    java,
    php,
    perl,
    scala
  ];

  static const cpp = LanguageItem(text: 'C++', image: 'assets/icons/cpp.png');

  static const python =
      LanguageItem(text: 'Python', image: 'assets/icons/python.png');

  static const python3 =
      LanguageItem(text: 'Python 3', image: 'assets/icons/python.png');

  static const java =
      LanguageItem(text: 'Java', image: 'assets/icons/java.png');

  static const php = LanguageItem(text: 'PHP', image: 'assets/icons/php.png');

  static const perl =
      LanguageItem(text: 'Perl', image: 'assets/icons/python.png');

  static const scala =
      LanguageItem(text: 'Scala', image: 'assets/icons/python.png');

  static Widget buildItem(LanguageItem item) {
    return Row(
      children: [
        Image.asset(
          item.image,
          height: 22.0,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class ThemeMenuItems {
  static const List<MenuItem> firstItems = [
    defaultt,
    lightfair,
    light,
    gradidark
  ];

  static const defaultt =
      MenuItem(text: 'Default', icon: EvaIcons.colorPaletteOutline);
  static const lightfair =
      MenuItem(text: 'Lightfair', icon: EvaIcons.colorPaletteOutline);
  static const light =
      MenuItem(text: 'Light', icon: EvaIcons.colorPaletteOutline);
  static const gradidark =
      MenuItem(text: 'GradiDark ', icon: EvaIcons.colorPaletteOutline);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: 22),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
