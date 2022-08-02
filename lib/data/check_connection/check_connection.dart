import 'dart:io';

class Connection {
  static bool checkConnection = false;
  static Future checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        checkConnection == true;
      }
    } on SocketException catch (_) {
      checkConnection == false;
    }
  }
}