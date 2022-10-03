import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../config/constants.dart';
import '../allert_dropdown/allert_dropdown.dart';

class PickImage {
  static Future<XFile?> imagePicker(BuildContext context) async {
    try {
      return await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: Constants.maxHeight,
        maxWidth: Constants.maxWidth,
        imageQuality: Constants.imageQuality,
      );
      // if (image == null) return;
      // final imageResult = File(image.path);
      // // pathImage = image.path;
    } catch (e) {
      AlertDropdown.error("Failed to pick image $e");
      throw ("Picker Failed");
    }
  }
}
