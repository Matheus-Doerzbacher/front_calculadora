import 'package:front_calculadora/service/http_service.dart';

class HomeController {
  final httpService = HttpService();

  Future<double> soma(String value1, String value2) async {
    final response = await httpService.post('/somar', {
      'X1': value1,
      'X2': value2,
    });
    return double.parse(response.body);
  }

  Future<double> subtrai(String value1, String value2) async {
    final response = await httpService.post('/sub', {
      'X1': value1,
      'X2': value2,
    });
    return double.parse(response.body);
  }

  Future<double> multiplica(String value1, String value2) async {
    final response = await httpService.post('/mult', {
      'X1': value1,
      'X2': value2,
    });
    return double.parse(response.body);
  }

  Future<double> divide(String value1, String value2) async {
    final response = await httpService.post('/div', {
      'X1': value1,
      'X2': value2,
    });
    return double.parse(response.body);
  }
}
