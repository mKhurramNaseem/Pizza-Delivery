extension Modification on String? {
  bool isEmail() {
    return ((this?.contains('@gmail.com')) ?? false) ? true : false;
  }
}
