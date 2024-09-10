import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testing/shared/components/constants.dart';


import '../../../models/NewsResponse.dart';
import '../../../models/source_reposne.dart';

class ApiManager {
  static Future<SourceResponse> getSources(String category) async {
    Uri url = Uri.https(Constants.BASE_URL, "/v2/top-headlines/sources",
        {"apiKey": "b804ee13d841483fb30d48a31bd6c56b", "category": category});
    http.Response resposne = await http.get(url);
    Map<String, dynamic> json = jsonDecode(resposne.body);

    return SourceResponse.fromJson(json);
  }

  static Future<NewsResponse> getNewsData(
      {String? sourceId, String? quary, int? pageSize, int? page}) async {
    Uri url = Uri.https(Constants.BASE_URL, "/v2/everything", {
      "sources": sourceId,
      "q": quary,
      "pageSize": pageSize.toString(),
      "page": page.toString()
    });
    var resposne = await http
        .get(url, headers: {"x-api-key": "b804ee13d841483fb30d48a31bd6c56b"});

    var json = jsonDecode(resposne.body);
    return NewsResponse.fromJson(json);
  }
}
