import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/app/app_bloc.dart';
import '../models/user_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  static const routeName = '/home';
  static Page page(String title) =>
      MaterialPage<void>(child: HomeScreen(title: title));

  @override
  Widget build(BuildContext context) {
    User user = context.select((AppBloc bloc) => bloc.state.user);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        // child: Text(
        //   'Welcome to MEALIFY',
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to MEALIFY',
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                '${user.email}',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Text(
              'Is user email verified: ${user.verifiedEmail}',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AppBloc>().add(
                AppLogoutRequested(),
              );
        },
        tooltip: 'Logout',
        child: const Icon(Icons.exit_to_app),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
