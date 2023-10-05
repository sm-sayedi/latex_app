import 'package:flutter/material.dart';
import 'package:latex_app/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        floatingActionButtonTheme: theme.floatingActionButtonTheme.copyWith(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        appBarTheme: theme.appBarTheme.copyWith(foregroundColor: Colors.black),
        textTheme: theme.textTheme.apply(fontFamily: 'CourierPrime'),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
