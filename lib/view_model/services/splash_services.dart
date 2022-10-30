import 'package:asif_taj_rest_flutter/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../data/model/user_model.dart';
import '../../utils/routes/routes_name.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      if (value.token == "null" || value.token == '') {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
        print("Null");
      } else {
        print("Somethig");
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
        // Navigator.pushNamedAndRemoveUntil(
        //     context, RoutesName.home, (Route<dynamic> route) => false);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
