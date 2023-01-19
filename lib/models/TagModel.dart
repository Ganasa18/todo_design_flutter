import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TagModel {
  final int id;
  final String title;
  final IconData iconData;

  TagModel(this.id, this.title, this.iconData);
}

// sample data
List<TagModel> tagList = [
  TagModel(1, "mobile", CupertinoIcons.phone),
  TagModel(2, "web", CupertinoIcons.globe),
  TagModel(3, "ios", CupertinoIcons.doc_append),
  TagModel(4, "android", CupertinoIcons.antenna_radiowaves_left_right),
  TagModel(5, "bot", CupertinoIcons.bolt),
  TagModel(6, "sport", CupertinoIcons.sportscourt),
  TagModel(7, "dll", CupertinoIcons.cube_box),
];
