
import 'package:flutter/material.dart';

class ImageUrlNull extends StatelessWidget {
  final Widget icon;
  final double height;
  final double width;

  const ImageUrlNull(this.icon,this.height,this.width,{Key?key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
      ),
      height:height,
      width: width,
      child: icon
    );
  }
}
