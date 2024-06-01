import 'dart:convert';
import 'dart:developer';

import 'package:chaty/data/api/base_url.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
part 'register_repository.g.dart';

enum RegisterState { initial, loading, success, error }

@riverpod
class Register extends _$Register {
  String errorMessage = '';
  @override
  RegisterState build() {
    return RegisterState.initial;
  }

  Future<void> register(String email, String username, String password,
      String fullname, String role) async {
    state = RegisterState.loading;
    try {
      final response = await http.post(
        Uri.parse(BaseUrl.baseUrl +
            Api.registerUrl), // Replace with your API endpoint
        body: jsonEncode({
          'email': email,
          'username': username,
          'password': password,
          'fullname': fullname,
          'role': role,
          "login_type": "nill",
  "active": false,
  "verified": false
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      log(response.body);

      if (response.statusCode == 200) {
        state = RegisterState.success;
        // Optionally, you can decode the response and create a LoginModel instance
        final data = jsonDecode(response.body);
        // LoginModel loginModel = LoginModel.fromJson(data);
      } else {
        var result = json.decode(response.body);
        errorMessage = result["detail"].toString();
        state = RegisterState.error;
      }
    } catch (e) {
      errorMessage = e.toString();
      state = RegisterState.error;
    }
  }
}
