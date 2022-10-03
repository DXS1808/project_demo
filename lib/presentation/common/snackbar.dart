import 'package:flutter/material.dart';
import 'package:project_demo/config/constants.dart';

enum TypeSnack { success, error }

class ShowSnackBar extends StatelessWidget {
  final TypeSnack typeSnack;
  final String content;

  const ShowSnackBar(this.typeSnack, this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    switch (typeSnack) {
      case TypeSnack.success:
        return snackBar(
            Colors.greenAccent,
            const Icon(
              Icons.done,
              color: Colors.green,
              size: 30,
            ));
      case TypeSnack.error:
        return snackBar(
            Colors.redAccent,
            const Icon(
              Icons.clear,
              color: Colors.redAccent,
              size: 30,
            ));
    }
  }

  Widget snackBar(Color color, Widget icon) {
    return ListTile(
        leading: icon,
        title: Text(
          content,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: Constants.textFontFamily),
        ));
  }
}
