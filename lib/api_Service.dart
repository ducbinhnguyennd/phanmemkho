import 'package:dio/dio.dart';
import 'package:qrcode/constant/strings_const.dart';
import 'imel.dart';

final Dio _dio = Dio();

class Login {
  Future<Response?> signIn(String username, String password) async {
    try {
      var response = await _dio.post(
        StringConst.urlogin,
        data: {"email": username, "password": password},
      );
      print('API response status: ${response.statusCode}');
      print('API response data: ${response.data}');
      return response;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}

class ApiService {
  Future<void> postImel(Imel imel) async {
    try {
      final response = await _dio.post(
        'https://appgiapha.vercel.app/posttest',
        data: imel.toJson(),
      );
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');
    } catch (e) {
      print('Error posting imel: $e');
    }
  }
}
