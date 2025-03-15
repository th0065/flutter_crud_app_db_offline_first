import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/bien_model.dart';
import '../helper/database_helper.dart';
import '../service/api_service.dart';

class BienProvider with ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final ApiService _apiService = ApiService();

  List<Bien> _biens = [];

  List<Bien> get biens => _biens;

  Future<void> loadBiens() async {
    try {
      // Récupérer les données du backend
      final onlineBiens = await _apiService.fetchBiens();

      // Synchroniser les données dans la base de données locale
      for (final bien in onlineBiens) {
        await _dbHelper.insertBien(bien.toMap());
      }

      // Charger les données depuis la base de données locale
      _biens = (await _dbHelper.getBiens()).map((map) => Bien.fromMap(map)).toList();
      notifyListeners();
    } catch (e) {
      print('Erreur lors de la synchronisation des biens: $e');
    }
  }

  Future<void> addBien(Bien bien) async {
    try {
      await _dbHelper.insertBien(bien.toMap());
      await loadBiens();
      await _apiService.syncBien(bien);
    } catch (e) {
      print('Erreur lors de l\'ajout du bien: $e');
    }
  }

  Future<void> updateBien(Bien bien) async {
    try {
      await _dbHelper.updateBien(bien.toMap());
      await loadBiens();
      await _apiService.syncBien(bien);
    } catch (e) {
      print('Erreur lors de la mise à jour du bien: $e');
    }
  }



  Future<void> deleteBien(int id) async {
    try {
      await _dbHelper.deleteBien(id);
      await loadBiens();
      await http.delete(Uri.parse('${_apiService.baseUrl}/$id'));
    } catch (e) {
      print('Erreur lors de la suppression du bien: $e');
    }
  }
}