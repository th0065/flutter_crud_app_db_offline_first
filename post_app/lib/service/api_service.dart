import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/bien_model.dart';

class ApiService {
  final String baseUrl = 'http://192.168.1.224:8000/biens';

  Future<void> syncBien(Bien bien) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(bien.toMap()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to sync bien');
    }
  }

  Future<List<Bien>> fetchBiens() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Bien.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load biens');
    }
  }
}