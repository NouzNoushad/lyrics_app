import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/routes/routes_string.dart';
import 'package:lyrics_app/utils/colors.dart';
import 'package:lyrics_app/utils/constant.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../data/blocs/connectivity_bloc/connectivity_bloc.dart';
import '../data/blocs/track_bloc/track_bloc.dart';

class Lyrics extends StatefulWidget {
  const Lyrics({super.key});

  @override
  State<Lyrics> createState() => _LyricsState();
}

class _LyricsState extends State<Lyrics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.background1,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorPicker.background2,
        title: const Text(
          'Lyrics',
          style: TextStyle(
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<ConnectivityBloc, ConnectivityState>(
        listener: (context, state) {
          if (state.status == ConnectivityStatus.disconnected) {
            Fluttertoast.showToast(msg: 'No internet connected');
          }
        },
        builder: (context, state) {
          if (state.status == ConnectivityStatus.connected) {
            return BlocConsumer<TrackBloc, TrackState>(
              listener: (context, state) {
                if (state.status == TrackStatus.failure) {
                  Fluttertoast.showToast(msg: 'Unable to connect');
                }
              },
              builder: (context, state) {
                if (state.status == TrackStatus.initial) {
                  return const Center(
                    child: CircularProgressIndicator(
                        color: ColorPicker.background2),
                  );
                }
                if (state.status == TrackStatus.success) {
                  return ListView.builder(
                    itemCount: state.tracks.length,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    itemBuilder: (context, index) {
                      var track = state.tracks[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteString.lyricsDetails,
                              arguments: track);
                        },
                        child: Card(
                          color: const Color.fromARGB(255, 71, 34, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  track.trackName,
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
                                  'Album: ${track.albumName}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Singer: ${track.artistName}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Container();
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
