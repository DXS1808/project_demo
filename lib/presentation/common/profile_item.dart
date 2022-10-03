import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:project_demo/config/constants.dart';

class ProfileItem extends StatelessWidget {
  final String content;
  final IconData icon;
  final VoidCallBack onTap;
  const ProfileItem({super.key, required this.content,required this.icon,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
            leading: Icon(icon,
            size: 25,
              color: Colors.black,
            ),
        title: Text(content,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: Constants.textFontFamily
        ),
        ),
        trailing: const Icon(Icons.navigate_next_sharp,
        color: Colors.black,
          size: 25,
        ),
      ),
    );
  }
}
