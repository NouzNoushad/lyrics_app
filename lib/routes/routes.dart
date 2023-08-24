import 'package:flutter/material.dart';
import 'package:lyrics_app/presentation/lyrics.dart';
import 'package:lyrics_app/routes/routes_string.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteString.lyrics:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteString.lyrics),
            builder: (context) => const Lyrics());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
