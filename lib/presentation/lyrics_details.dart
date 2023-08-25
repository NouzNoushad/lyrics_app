import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lyrics_app/utils/colors.dart';
import 'package:lyrics_app/utils/constant.dart';

import '../data/blocs/lyrics_bloc/lyrics_bloc.dart';
import '../data/models/track_response.dart';
import '../data/repositories/lyrics_repository.dart';

class LyricsDetails extends StatefulWidget {
  final Track track;
  const LyricsDetails({super.key, required this.track});

  @override
  State<LyricsDetails> createState() => _LyricsDetailsState();
}

class _LyricsDetailsState extends State<LyricsDetails> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => LyricsRepository(),
      child: BlocProvider(
        create: (context) => LyricsBloc(
            track: widget.track,
            lyricsRepository: RepositoryProvider.of<LyricsRepository>(context))
          ..add(const LyricsLoadedEvent()),
        child: Scaffold(
          backgroundColor: ColorPicker.background1,
          appBar: AppBar(
            backgroundColor: ColorPicker.background2,
            title: const Text('Lyrics'),
            centerTitle: true,
          ),
          body: BlocConsumer<LyricsBloc, LyricsState>(
            listener: (context, state) {
              if (state.status == LyricsStatus.failure) {
                Fluttertoast.showToast(msg: 'Unable to connect');
              }
            },
            builder: (context, state) {
              if (state.status == LyricsStatus.initial) {
                return const Center(
                  child:
                      CircularProgressIndicator(color: ColorPicker.background2),
                );
              }
              if (state.status == LyricsStatus.success) {
                return ListView(padding: const EdgeInsets.all(10), children: [
                  Card(
                    color: const Color.fromARGB(255, 71, 34, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Column(children: [
                        Text(
                          state.track.trackName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Album: ${state.track.albumName}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Singer: ${state.track.artistName}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Card(
                    color: const Color.fromARGB(255, 71, 34, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Text(
                        state.track.lyricsBody.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
                ]);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
