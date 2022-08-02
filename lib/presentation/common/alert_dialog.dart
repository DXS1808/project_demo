import 'package:flutter/material.dart';
import 'package:project_demo/presentation/common/snackbar.dart';

class AlertShowMessage {
  static Future success(BuildContext context, String content) async {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.greenAccent,
        elevation: 5.0,
        padding: const EdgeInsets.all(5.0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        content: ShowSnackBar(TypeSnack.success, content)));
  }

  static Future error(BuildContext context, String content) async {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.redAccent,
        elevation: 5.0,
        padding: const EdgeInsets.all(5.0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        content: ShowSnackBar(TypeSnack.error, content)));
  }
}
