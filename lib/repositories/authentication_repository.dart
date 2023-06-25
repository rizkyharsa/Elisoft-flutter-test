import 'package:dio/dio.dart';
import 'package:elisoft_flutter_test/constants/api_constant.dart';

import '../models/login/user.dart';

class AuthenticationRepository {
  final Dio dio = Dio();
  Future<User> authentication(String email, String password) async {
    final response = await dio.post('$baseUrl/auth/login', data: {'email': email, 'password': password});
    print(response.data);
    return User.fromJson(response.data);
    // try {
    //   final response = await dio.post('$baseUrl/auth/login', data: {'email': email, 'password': password});
    //   return response.statusCode == 200 ? true : false;
    // } catch (e) {
    //   print("Error: $e");
    //   return false;
    // }
  }
}
