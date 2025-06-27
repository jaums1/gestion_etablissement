import 'package:get/get.dart';
import '../Model/versement_model.dart';

class TVersementRepository extends GetxController {
  final List<TVersementModel> _versements = [];

  List<TVersementModel> getAll() => _versements;

  void add(TVersementModel versement) {
    _versements.add(versement);
  }

  void updateVersement(int index, TVersementModel versement) {
    if (index >= 0 && index < _versements.length) {
      _versements[index] = versement;
    }
  }

  void delete(int index) {
    if (index >= 0 && index < _versements.length) {
      _versements.removeAt(index);
    }
  }
} 