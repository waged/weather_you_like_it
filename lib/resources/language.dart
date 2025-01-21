// ignore_for_file: constant_identifier_names

const String ENGLISH = "en";
const String DEUTSCH = "de";

enum LanguageType { ENGLISH, DEUTSCH }

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.DEUTSCH:
        return DEUTSCH;
    }
  }
}
