import 'package:asif_taj_rest_flutter/utils/routes/routes_name.dart';
import 'package:asif_taj_rest_flutter/view/home_screen.dart';
import 'package:asif_taj_rest_flutter/view/login_screen.dart';
import 'package:asif_taj_rest_flutter/view/signup_view.dart';
import 'package:asif_taj_rest_flutter/view/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpView());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}
