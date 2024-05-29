// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:chaty/data/api/base_url.dart';
import 'package:chaty/model/signin_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: BaseUrl.baseUrl,
    connectTimeout: const Duration(milliseconds: 50000),
    receiveTimeout: const Duration(milliseconds: 30000),
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  Future<SignInModel> signIn(String email, String password) async {
    try {
      final response = await _dio
          .post(Api.loginUrl, data: {'email': email, 'password': password});
      return SignInModel.fromJson(response.data);
    }on DioError catch (dioError) {
      DioErrorHandle()._handleDioError(dioError);
      throw Exception('error');
    }  catch (e) {
      throw Exception('An unexpected error occured : $e');
    }
  }

  // static Future<SignInModel> signIn(String email, String password) async {
  //   try {
  //     final response = await http.post(
  //         Uri.parse(BaseUrl.baseUrl + Api.loginUrl),
  //         body: {'email': email, 'password': password});

  //     return SignInModel.fromJson(jsonDecode(response.body));
  //   } on DioError catch (dioError) {
  //     DioErrorHandle()._handleDioError(dioError);
  //     throw Exception('error');
  //   } catch (e) {
  //     throw Exception('Failed to Login : $e');
  //   }
  // }
}

class DioErrorHandle {
  void _handleDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        throw Exception('Connection Timeout Exception');
      case DioErrorType.sendTimeout:
        throw Exception('Send Timeout Exception');
      case DioErrorType.receiveTimeout:
        throw Exception('Receive Timeout Exception');
      case DioErrorType.badResponse:
        // The server responded with a non-2xx status code
        throw Exception(
            'Received invalid status code: ${dioError.response?.statusCode}');
      case DioErrorType.cancel:
        throw Exception('Request to API server was cancelled');
      case DioErrorType.unknown:
        throw Exception('Network error occurred: ${dioError.message}');
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        throw Exception('Bad error occurred: ${dioError.message}');
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        throw Exception('Connection error occurred: ${dioError.message}');
    }
  }
}
