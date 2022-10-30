import 'package:asif_taj_rest_flutter/data/network/BaseApiService.dart';
import 'package:asif_taj_rest_flutter/data/network/NetworkApiService.dart';
import 'package:asif_taj_rest_flutter/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPointUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.registerEndPointUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
