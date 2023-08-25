import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lyrics_app/data/repositories/lyrics_repository.dart';
import 'package:lyrics_app/routes/routes.dart';
import 'package:lyrics_app/routes/routes_string.dart';
import 'package:lyrics_app/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/blocs/connectivity_bloc/connectivity_bloc.dart';
import 'data/blocs/track_bloc/track_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => LyricsRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TrackBloc(
              lyricsRepository:
                  RepositoryProvider.of<LyricsRepository>(context),
            )..add(TrackFetchedEvent()),
          ),
          BlocProvider(
            create: (context) => ConnectivityBloc(connectivity: Connectivity())
              ..add(const ConnectedEvent()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: ColorPicker.colorScheme),
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.onGenerateRoute,
          initialRoute: RouteString.lyrics,
        ),
      ),
    );
  }
}
