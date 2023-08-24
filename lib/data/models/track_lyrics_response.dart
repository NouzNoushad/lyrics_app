// To parse this JSON data, do
//
//     final trackLyricsResponse = trackLyricsResponseFromJson(jsonString);

import 'dart:convert';

TrackLyricsResponse trackLyricsResponseFromJson(String str) =>
    TrackLyricsResponse.fromJson(json.decode(str));

String trackLyricsResponseToJson(TrackLyricsResponse data) =>
    json.encode(data.toJson());

class TrackLyricsResponse {
  Message message;

  TrackLyricsResponse({
    required this.message,
  });

  factory TrackLyricsResponse.fromJson(Map<String, dynamic> json) =>
      TrackLyricsResponse(
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
      };
}

class Message {
  Header header;
  Body body;

  Message({
    required this.header,
    required this.body,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        header: Header.fromJson(json["header"]),
        body: Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "header": header.toJson(),
        "body": body.toJson(),
      };
}

class Body {
  Lyrics lyrics;

  Body({
    required this.lyrics,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        lyrics: Lyrics.fromJson(json["lyrics"]),
      );

  Map<String, dynamic> toJson() => {
        "lyrics": lyrics.toJson(),
      };
}

class Lyrics {
  int lyricsId;
  int explicit;
  String lyricsBody;
  String scriptTrackingUrl;
  String pixelTrackingUrl;
  String lyricsCopyright;
  DateTime updatedTime;

  Lyrics({
    required this.lyricsId,
    required this.explicit,
    required this.lyricsBody,
    required this.scriptTrackingUrl,
    required this.pixelTrackingUrl,
    required this.lyricsCopyright,
    required this.updatedTime,
  });

  factory Lyrics.fromJson(Map<String, dynamic> json) => Lyrics(
        lyricsId: json["lyrics_id"],
        explicit: json["explicit"],
        lyricsBody: json["lyrics_body"],
        scriptTrackingUrl: json["script_tracking_url"],
        pixelTrackingUrl: json["pixel_tracking_url"],
        lyricsCopyright: json["lyrics_copyright"],
        updatedTime: DateTime.parse(json["updated_time"]),
      );

  Map<String, dynamic> toJson() => {
        "lyrics_id": lyricsId,
        "explicit": explicit,
        "lyrics_body": lyricsBody,
        "script_tracking_url": scriptTrackingUrl,
        "pixel_tracking_url": pixelTrackingUrl,
        "lyrics_copyright": lyricsCopyright,
        "updated_time": updatedTime.toIso8601String(),
      };
}

class Header {
  int statusCode;
  double executeTime;

  Header({
    required this.statusCode,
    required this.executeTime,
  });

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        statusCode: json["status_code"],
        executeTime: json["execute_time"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "execute_time": executeTime,
      };
}
