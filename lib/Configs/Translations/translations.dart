import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'hello': 'Hello',
      'logout': 'Logout',
    },
    'fr': {
      'hello': 'Bonjour',
      'logout': 'Déconnexion',
    },
  };
}
