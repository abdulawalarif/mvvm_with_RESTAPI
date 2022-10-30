import 'package:asif_taj_rest_flutter/res/components/round_button.dart';
import 'package:asif_taj_rest_flutter/utils/routes/routes_name.dart';
import 'package:asif_taj_rest_flutter/utils/utils.dart';
import 'package:asif_taj_rest_flutter/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _obsecurePassword.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);

    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(
                  Icons.alternate_email,
                ),
              ),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                  context,
                  emailFocusNode,
                  passwordFocusNode,
                );
              },
              focusNode: emailFocusNode,
            ),
            ValueListenableBuilder(
              valueListenable: _obsecurePassword,
              builder: (
                context,
                value,
                child,
              ) {
                return TextFormField(
                  focusNode: passwordFocusNode,
                  controller: _passwordController,
                  obscureText: _obsecurePassword.value,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    prefixIcon: const Icon(
                      Icons.key,
                    ),
                    suffixIcon: InkWell(
                      child: (Icon(_obsecurePassword.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility)),
                      onTap: () {
                        _obsecurePassword.value = !_obsecurePassword.value;
                      },
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: height * .0381,
            ),
            RoundButton(
              title: 'Login',
              loading: authViewMode.loading,
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage("Please enter email", context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage("Please enter password", context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      "Please enter 6 digit password", context);
                } else {
                  // Map data = {
                  //   "email": _emailController.text.toString(),
                  //   "password": _passwordController.text.toString(),
                  // };
                  Map data = {
                    "email": "eve.holt@reqres.in",
                    "password": "cityslicka",
                  };
                  authViewMode.loginApi(data, context);
                  print("Api Hit");
                }
              },
            ),
            SizedBox(
              height: height * .02,
            ),
            InkWell(
                onTap: () {
                  //Navigator.pushNamed(context, RoutesName.signUp);
                  Navigator.pushNamedAndRemoveUntil(context, RoutesName.signUp,
                      (Route<dynamic> route) => false);
                },
                child: Text("Don't have account? SignUp"))
          ],
        ),
      ),
    );
  }
}
