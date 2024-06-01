import 'dart:convert';

import 'package:chaty/data/api/base_url.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
part 'otp_repository.g.dart';

enum OtpVerifyState { initial, loading, success, error }


@riverpod
class OtpVerify extends _$OtpVerify {
  var errorMessage = '';
  @override
  OtpVerifyState build() {
    return OtpVerifyState.initial;
  }

  Future<void> otpVerify(String email, String otp) async {
    try {
      state = OtpVerifyState.loading;
      final response = await http.post(
        Uri.parse(BaseUrl.baseUrl + Api.otpUrl),
        body: jsonEncode({'email': email, 'otp': otp}),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        state = OtpVerifyState.success;
      } else {
        state = OtpVerifyState.error;
        var result = json.decode(response.body);
        var _errormessage = result['detail'].toString();

        errorMessage = _errormessage;
      }
    } catch (e) {
      state = OtpVerifyState.error;
      errorMessage = e.toString();
    }
  }
}
