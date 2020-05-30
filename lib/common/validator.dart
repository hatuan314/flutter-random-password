bool validationStrongPassword(String value) {
  Pattern pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{0,}$';
  RegExp regExp = new RegExp(pattern);
  if (regExp.hasMatch(value)) return true;
  return false;
}

bool validationNumber(String value) {
  Pattern pattern = r'[0-9]';
  RegExp regex = new RegExp(pattern);
  if (regex.hasMatch(value)) return true;
  return false;
}

List<int> noSafeCharacter = [
  39,
  40,
  41,
  43,
  44,
  45,
  46,
  47,
  58,
  59,
  60,
  61,
  62,
  63,
  91,
  92,
  93,
  95,
  96
];
