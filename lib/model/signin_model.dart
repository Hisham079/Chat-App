class SignInModel {
  String? status;
  String? accessToken;

  SignInModel({this.status, this.accessToken});

  SignInModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['access_token'] = this.accessToken;
    return data;
  }
}