
import 'package:flutter/material.dart';

class AvatarNull extends StatelessWidget {
  String name;
  AvatarNull({Key? key,required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 50,
      backgroundColor: Colors.brown,
      child: Text(name.trim()[0].toUpperCase(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 35,
        fontWeight: FontWeight.w500
      ),
      ),
    );
  }
}
