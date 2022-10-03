import 'package:flutter/material.dart';
import 'package:project_demo/config/constants.dart';

class CategoryText extends StatelessWidget {
  final Color? color;
  final String category;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? softWrap;

  const CategoryText(
      {Key? key,
      required this.category,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.softWrap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      category,
      softWrap: softWrap ?? true,
      style: TextStyle(
          fontFamily: Constants.textFontFamily,
          color: color ?? Colors.grey,
          fontSize: fontSize ?? 11,
          fontWeight: fontWeight ?? FontWeight.w500),
    );
  }
}
