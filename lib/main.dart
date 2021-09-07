import 'package:flutter/material.dart';
import 'package:movie_app/presentation/home/home_page.dart';
import 'package:movie_app/presentation/utils/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: AppTheme.myTheme,
      home: HomePage(),
    );
  }
}
