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
    String site_url = 'https://your_site_base_url.com';
    // this is the username of a valid joomla account
    String username = 'your_username_here';
    // this is the password of the above user account
    String password = 'your_password_here';


    // make the basicAuth string
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    // set the headers
    Map<String, String> headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': basicAuth
    };
    print('basicAuth: $basicAuth');

    print('site_url: $site_url');

    // add the joomla v4 API to the 
    var url = "$site_url/api/index.php/v1/content/article";
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

      return null;
    }
  }


}
