
import 'package:flutter/material.dart';

class ImageUrlNull extends StatelessWidget {
  final Widget icon;
  final double height;
  final double width;

  const ImageUrlNull(this.icon,this.height,this.width,{Key?key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.grey,
      ),
      height:height,
      width: width,
      child: icon
    );
  }
}
