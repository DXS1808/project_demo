
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMedia extends StatelessWidget {
  VoidCallback press;
  Color color;
  Widget icon;
  SocialMedia({Key? key,required this.press,required this.color,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 50,
          decoration: BoxDecoration(
            color: color,
            boxShadow: [
              BoxShadow(
                color:const Color(0xff000000).withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
            shape: BoxShape.circle,
          ),
          child:  Center(
            child:icon,
          ),
        )
    );
  }
}
