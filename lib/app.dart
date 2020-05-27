import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:createsecurepassword/ui/home_page.dart';
import 'package:createsecurepassword/blocs/random_password_bloc/random_password_bloc.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => RandomPasswordBloc(),
          child: HomePage()),
    );
  }
}
