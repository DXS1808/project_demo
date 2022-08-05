class StringUltis {
  static bool isEmail(String email) {
    final RegExp regExp = RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
    return regExp.hasMatch(email.trim());
  }

  static bool isPassword(String password) {
    final RegExp regExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return regExp.hasMatch(password.trim());
  }

  static bool isImage(String url){
    final RegExp regExp = RegExp("([/|.|\w|\s|-])*\.(?:jpg|gif|png)");
    return regExp.hasMatch(url.trim());
  }
}
