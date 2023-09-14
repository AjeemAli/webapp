import 'dart:convert';
import 'package:dio/dio.dart';
import '../model/userModel.dart';

class UserRepository {
  String userUrl = 'https://reqres.in/api/users?page=2';
  Dio dio = Dio();

  Future<List<UserModel>?> getUsers() async {
    try {
      Response response = await dio.get(userUrl);
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.data)['data'];
        return result.map((e) => UserModel.fromJson(e)).toList();
      } else {
        print('API call failed with status code ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
    return null;
  }
}
