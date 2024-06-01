// ignore_for_file: deprecated_member_use
import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:chaty/data/api/base_url.dart';
import 'package:http/http.dart' as http;
part 'auth_repository.g.dart';

enum AuthenticationState { initial, loading, success, error }

@riverpod
class Authentication extends _$Authentication {
  String errorMessage = '';

  /// Notifier arguments are specified on the build method.5
  /// There can be as many as you want, have any name, and even be optional/named.
  @override
  AuthenticationState build() {
    return AuthenticationState.initial;
  }

  Future<void> login(String email, String password) async {
    state = AuthenticationState.loading;

    try {
      final response = await http.post(
        Uri.parse(
            BaseUrl.baseUrl + Api.loginUrl), // Replace with your API endpoint
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Optionally, you can decode the response and create a LoginModel instance
        final data = jsonDecode(response.body);
        // LoginModel loginModel = LoginModel.fromJson(data);
        state = AuthenticationState.success;
      } else {
        var result = json.decode(response.body);
        errorMessage = result["detail"].toString();
        state = AuthenticationState.error;
      }
    } catch (e) {
      errorMessage = e.toString();
      state = AuthenticationState.error;
    }
  }



}




// class AuthRepository {
//   final Dio _dio = Dio(BaseOptions(
//     baseUrl: BaseUrl.baseUrl,
//     connectTimeout: const Duration(milliseconds: 50000),
//     receiveTimeout: const Duration(milliseconds: 30000),
//     headers: {
//       'Content-Type': 'application/json',
//     },
//   ));

//   // Future<SignInModel> signIn(String email, String password) async {
//   //   try {
//   //     final response = await _dio
//   //         .post(Api.loginUrl, data: {'email': email, 'password': password});
//   //     return SignInModel.fromJson(response.data);
//   //   } on DioError catch (dioError) {
//   //     DioErrorHandle()._handleDioError(dioError);
//   //     throw Exception('error');
//   //   } catch (e) {
//   //     throw Exception('An unexpected error occured : $e');
//   //   }
//   // }
// }

