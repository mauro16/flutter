import 'package:flutter/material.dart';
import 'package:makemebela/blocs/home_bloc.dart';
import 'package:provider/provider.dart';
import 'pages/home-screen/home.dart';

Future<Null> main() async {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HomeBloc>(
          create: (_) => HomeBloc(),
          dispose: (context, value) => value.dispose(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: ' Make me Bella',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.pink[50],
        ),
        home: HomeScreen(),
      ),
    );
  }
}
