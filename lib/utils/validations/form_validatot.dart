String? validateUserName(String? text) {
  if (text == null || text.trim().isEmpty) {
    return "Username Required";
  } else {
    return null;
  }
}
