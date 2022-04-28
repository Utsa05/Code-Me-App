import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';

class NavItemModel {
  final int id;
  final IconData iconData;
  final String name;

  NavItemModel({
    required this.id,
    required this.iconData,
    required this.name,
  });
}

List<NavItemModel> navitemlist = [
  NavItemModel(id: 0, iconData: EvaIcons.homeOutline, name: 'Home'),
  NavItemModel(id: 1, iconData: EvaIcons.textOutline, name: 'Code'),
  NavItemModel(id: 2, iconData: EvaIcons.heartOutline, name: 'Search'),
];
