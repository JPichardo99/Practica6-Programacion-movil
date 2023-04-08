import 'package:api_consumo/models/chapter_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://rickandmortyapi.com/api/character';

  static Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body)['results'];
      return json.map((character) => Character.fromJson(character)).toList();
    } else {
      throw Exception('Error al obtener los personajes');
    }
  }
}
