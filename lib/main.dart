import 'package:flutter/material.dart';
import 'package:lyrics_app/routes/routes.dart';
import 'package:lyrics_app/routes/routes_string.dart';
import 'package:lyrics_app/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.colorScheme),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: RouteString.lyrics,
    );
  }
}
