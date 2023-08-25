import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lyrics_app/data/models/track_response.dart';
import 'package:lyrics_app/utils/end_points.dart';

import '../models/chart_response.dart';
import '../models/track_lyrics_response.dart';

class LyricsRepository {
  Client baseClient = Client();
  Future<List<Track>> getLyricsChart() async {
    List<Track> trackList;
    Map<String, String> queries = {
      'chart_name': EndPoints.chartName,
      'page': '${EndPoints.page}',
      'page_size': '${EndPoints.pageSize}',
      'f_has_lyrics': '${(EndPoints.fHasLyrics) ? 1 : 0}',
      'apikey': EndPoints.apiKey,
    };
    Uri url = Uri.https(
      EndPoints.baseUrl,
      '${EndPoints.path}/chart.tracks.get',
      queries,
    );
    var response = await baseClient.get(url);
    if (response.statusCode == 200) {
      ChartResponse chartResponse = chartResponseFromJson(response.body);
      debugPrint(
          '////////////////////// chart response: ${chartResponse.message.body.trackList}');
      var trackListResponse = chartResponse.message.body.trackList;
      trackList = await Future.wait(trackListResponse.map((track) async {
        var commonTrackId = track.track.commontrackId;
        var trackResponse = await getTracks(commonTrackId);
        return trackResponse;
      }));
    } else {
      throw Exception('Error fetching list');
    }
    return trackList;
  }

  Future<Track> getTracks(int commonTrackId) async {
    Track track;
    Map<String, String> queries = {
      'commontrack_id': '$commonTrackId',
      'apikey': EndPoints.apiKey,
    };
    Uri url = Uri.https(
      EndPoints.baseUrl,
      '${EndPoints.path}/track.get',
      queries,
    );
    var response = await baseClient.get(url);
    if (response.statusCode == 200) {
      TrackResponse trackResponse = trackResponseFromJson(response.body);
      track = trackResponse.message.body.track;
    } else {
      throw Exception('Error fetching track');
    }
    return track;
  }

  Future<Track> getTrackLyrics(Track track) async {
    Map<String, String> queries = {
      'commontrack_id': '${track.commontrackId}',
      'track_id': '${track.trackId}',
      'apikey': EndPoints.apiKey,
    };
    Uri url = Uri.https(
      EndPoints.baseUrl,
      '${EndPoints.path}/track.lyrics.get',
      queries,
    );
    var response = await baseClient.get(url);
    if (response.statusCode == 200) {
      TrackLyricsResponse trackLyricsResponse =
          trackLyricsResponseFromJson(response.body);

      track.lyricsBody = trackLyricsResponse.message.body.lyrics.lyricsBody;
      debugPrint(
          '///////////////// track lyrics response: ${track.lyricsBody}');
    } else {
      throw Exception('Error fetching track lyrics');
    }
    return track;
  }
}
