import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import './model/news.dart';

class API {
  static final URL = 'https://newsapi.org/v2/';
  static final COUNTRY = 'id';
  static final API_KEY = '0011a3c08d6c44bc8e68eb7bce22b787';

  //endpoint

  static final TOP_HEADLINES = URL + 'top-headlines?' + 'country=' + COUNTRY + '&apiKey=' + API_KEY;

  Future<List<News>> getTopHeadlines() async {

    List<News> listNews = [];
    listNews.clear();

    await new http.Client()
    .get(TOP_HEADLINES)
    .then((response) => response.body)
    .then(json.decode)
    .then((json) => json['articles'])
    .then((news) => news
      .forEach((news) => listNews.add(new News.fromJson(news))));
    
    
    return listNews;
  }
}