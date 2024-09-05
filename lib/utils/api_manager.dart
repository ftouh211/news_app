import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/utils/constants.dart';
import 'package:news_app/models/news_data_response.dart';
import 'package:news_app/models/sorces_response.dart';

class ApiManager {
  static Future<SourceResponse> getSources(String id) async {
    //https://newsapi.org/v2/top-headlines/sources?apiKey=285f96636608445c8661d65537f9e94a&=
    Uri url = Uri.https(Constants.baseUrl, "/v2/top-headlines/sources",
        {
          "apiKey" : Constants.apiKey,
          "category" : id
        });
    http.Response response = await http.get(url);

    var json = jsonDecode(response.body);

    SourceResponse sourceResponse = SourceResponse.fromJson(json);
    return sourceResponse;
  }

  static Future<NewsDataResponse> getNewsData(String sourcesID) async {
    Uri url =
        Uri.https(Constants.baseUrl, "/v2/everything", {"sources": sourcesID});
    http.Response response = await http.get(url, headers: {
      // "apiKey": Constants.apiKey,
      "x-api-key": Constants.apiKey,
    });

    var json = jsonDecode(response.body);

    NewsDataResponse model = NewsDataResponse.fromJson(json);

    return model;
  }
}
