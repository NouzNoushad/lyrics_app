import 'package:http/http.dart';
import 'package:lyrics_app/utils/end_points.dart';

class LyricsRepository {
  Client baseClient = Client();
  fetchLyrics() async {
    Map<String, String> queries = {
      'chart_name': EndPoints.chartName,
      'page': '${EndPoints.page}',
      'page_size': '${EndPoints.pageSize}',
      'f_has_lyrics': '${(EndPoints.fHasLyrics) ? 1 : 0}',
      'apikey': EndPoints.apiKey,
    };
    Uri url = Uri.https(
      EndPoints.baseUrl,
      EndPoints.path,
      queries,
    );
    var response = await baseClient.get(url);
    if(response.statusCode == 200){
      
    }
  }
}
