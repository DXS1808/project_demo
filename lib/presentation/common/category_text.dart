
import 'package:flutter/material.dart';
import 'package:project_demo/config/constants.dart';

class CategoryText extends StatelessWidget {
  Color ? color;
  String category;
  double ? fontSize;
  FontWeight ? fontWeight;
  CategoryText({Key? key,required this.category,this.color,this.fontSize,this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      category,
      style: TextStyle(
        fontFamily: Constants.FONTFAMILY,
        color: color ?? Colors.grey,
        fontSize: fontSize ?? 11,
        fontWeight: fontWeight ?? FontWeight.w500
      ),
    );
  }
}
