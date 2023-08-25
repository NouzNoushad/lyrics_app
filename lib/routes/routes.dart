import 'package:flutter/material.dart';
import 'package:lyrics_app/presentation/lyrics.dart';
import 'package:lyrics_app/presentation/lyrics_details.dart';
import 'package:lyrics_app/routes/routes_string.dart';

import '../data/models/track_response.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteString.lyrics:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteString.lyrics),
            builder: (context) => const Lyrics());
      case RouteString.lyricsDetails:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteString.lyricsDetails),
            builder: (context) => LyricsDetails(track: settings.arguments as Track,));
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
