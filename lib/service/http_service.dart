import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpService {
  // URL base que funciona em diferentes ambientes
  late String _baseUrl;

  HttpService() {
    // Configure baseUrl based on platform
    if (kIsWeb) {
      // Web usa localhost diretamente
      _baseUrl = 'http://localhost:8080';
    } else {
      // Dispositivos nativos - 10.0.2.2 para Android emulator
      // e localhost para iOS simulator
      _baseUrl = 'http://localhost:8080';
    }

    if (kDebugMode) {
      print('HttpService initialized with baseUrl: $_baseUrl');
    }
  }

  set baseUrl(String url) => _baseUrl = url;

  Future<http.Response> get(String path) async {
    try {
      final uri = Uri.parse('$_baseUrl$path');
      if (kDebugMode) {
        print('GET request to: $uri');
      }
      final response = await http.get(
        uri,
        headers: {'Content-Type': 'application/json'},
      );
      if (kDebugMode) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      return response;
    } catch (e) {
      if (kDebugMode) print('Error in GET request: $e');
      throw Exception('Failed to get data from $path: $e');
    }
  }

  Future<http.Response> post(String path, dynamic body) async {
    try {
      final uri = Uri.parse('$_baseUrl$path');
      if (kDebugMode) {
        print('POST request to: $uri');
        print('Request body: ${jsonEncode(body)}');
      }
      final response = await http.post(
        uri,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );
      if (kDebugMode) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      return response;
    } catch (e) {
      if (kDebugMode) print('Error in POST request: $e');
      throw Exception('Failed to post data to $path: $e');
    }
  }
}
