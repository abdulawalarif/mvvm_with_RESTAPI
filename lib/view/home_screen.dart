import 'package:asif_taj_rest_flutter/utils/routes/routes_name.dart';
import 'package:asif_taj_rest_flutter/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                userPreferences.remove().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: Text("LogOut"),
            )
          ],
        ),
      ),
    );
  }
}
