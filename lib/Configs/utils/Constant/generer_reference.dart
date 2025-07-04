import 'dart:math';

class TGenerationReference{

  static String H_GenererReference({String? ref}) {
    final now = DateTime.now();
    final reference = '$ref-${now.millisecondsSinceEpoch}${Random().nextInt(1000)}';
    return reference;
  }
}