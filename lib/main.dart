import 'package:flutter/material.dart';
import 'package:flutter_most_test_project/screen/user/screens/user_login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Most',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UserLogin());
  }
}
