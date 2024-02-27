import 'package:flutter/material.dart';
import 'package:home_work_8/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.pink,
          scaffoldBackgroundColor: const Color(0xff0a0321),
          // ignore: deprecated_member_use
          textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
          appBarTheme: const AppBarTheme(
              elevation: 0, centerTitle: true, color: Color(0xff0a0321))),
      home: const Home(),
    );
  }
}
