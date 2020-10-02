import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:joomla4api_basic_flutter_app/Model/joomla_articles.dart';

class RestApiManager {
  Future<JoomlaArticles> fetchJoomlaArticles() async {
    /*--------------------------------------
    Set these bits with your site details
    --------------------------------------*/
    // your site's base URL, must be https
    String siteUrl = 'http://YOUR_DOMAIN';

    // Your bearer token, from the joomla user manager, edit a user, then click on the "Joomla API Token" tab and generate a "token"
    String basicAuth = 'Bearer YOUR_API_TOKEN';
    // set the headers
    Map<String, String> headers = {
      'content-type': 'application/json',
      'accept': '*/*',
      'authorization': basicAuth
    };
    print('basicAuth: $basicAuth');

    print('site_url: $siteUrl');

    // add the joomla v4 API to the
    var url = "$siteUrl/api/index.php/v1/content/article";
    print('endpoint url: $url');

    // Await the http get response, then decode the json-formatted responce.
    var response = await get(url, headers: headers);

    print('response.statusCode: ${response.statusCode}');

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print('json response: $jsonResponse ');

      final articles = joomlaArticlesFromJson(response.body);

      return articles;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      print("Request failed with body: ${response.body}.");

      return null;
    }
  }
}
