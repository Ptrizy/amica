import 'package:amica/model/pet_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PetProvider extends ChangeNotifier {
  final _db = FirebaseDatabase.instance.ref();
  List<Pet> _pets = [];
  bool _isLoading = true;
  Pet? _selectedPet;

  List<Pet> get pets => _pets;
  bool get isLoading => _isLoading;
  Pet? get selectedPet => _selectedPet;

  Future<void> loadPets() async {
    try {
      final snapshot = await _db.get();
      if (snapshot.exists) {
        _pets = (snapshot.value as List)
            .map((item) => Pet.fromJson(Map<String, dynamic>.from(item)))
            .toList();
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setSelectedPet(Pet pet) {
    _selectedPet = pet;
    notifyListeners();
  }
}
