import 'dart:convert';
import 'dart:io';

import 'package:front_calculadora/model/ususario.dart';
import 'package:front_calculadora/service/http_service.dart';

class LoginController {
  final HttpService _httpService = HttpService();

  Future<Usuario> login(String email, String password) async {
    final response = await _httpService.post('/api/login', {
      'email': email,
      'password': password,
    });

    if (response.statusCode == HttpStatus.ok) {
      return Usuario.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }
}
