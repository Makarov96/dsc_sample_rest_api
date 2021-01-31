import 'dart:convert';

import 'package:dsc_sample_api_rest/user/datasources/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserRemoteDataSource {
  Future<UserModel> remoteData() async {
    final data = await http.get('https://reqres.in/api/users?page=2');
    return UserModel.fromJson(json.decode(data.body));
  }
}
