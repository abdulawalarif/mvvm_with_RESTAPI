import 'package:asif_taj_rest_flutter/data/response/status.dart';
import 'package:asif_taj_rest_flutter/utils/routes/routes_name.dart';
import 'package:asif_taj_rest_flutter/utils/utils.dart';
import 'package:asif_taj_rest_flutter/view_model/home_view_model.dart';
import 'package:asif_taj_rest_flutter/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    super.initState();
    homeViewViewModel.fetchMoviesListApi();
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            InkWell(
              onTap: () {
                userPreferences.remove().then(
                  (value) {
                    Navigator.pushNamed(context, RoutesName.login);
                  },
                );
              },
              child: Center(child: Text("LogOut")),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: ChangeNotifierProvider<HomeViewViewModel>(
          create: (BuildContext context) => homeViewViewModel,
          child: Consumer<HomeViewViewModel>(
            builder: (context, value, _) {
              switch (value.moviesList.status) {
                case Status.LOADING:
                  return Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  return Center(
                      child: Text(value.moviesList.message.toString()));
                case Status.COMPLETED:
                  return ListView.builder(
                      itemCount: value.moviesList.data!.movies!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: Image.network(
                              value.moviesList.data!.movies![index].posterurl
                                  .toString(),
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.error,
                                  color: Colors.red,
                                );
                              },
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              value.moviesList.data!.movies![index].title
                                  .toString(),
                            ),
                            subtitle: Text(
                              value.moviesList.data!.movies![index].year
                                  .toString(),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(Utils.averageRating(value.moviesList.data!
                                        .movies![index].ratings!)
                                    .toStringAsFixed(1)),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                              ],
                            ),
                          ),
                        );
                      });
              }
              return Container();
            },
          ),
        ));
  }
}
