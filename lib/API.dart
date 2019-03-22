import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import './model/news.dart';

class API {
  static final URL = 'https://newsapi.org/v2/';
  // static final COUNTRY = 'id';
  static final API_KEY = '0011a3c08d6c44bc8e68eb7bce22b787';

  //endpoint

  static final TOP_HEADLINES = URL + 'top-headlines?country=id&apiKey=' + API_KEY;
   List<News> listNews = [];

  Future<List<News>> getTopHeadlines() async {

   
    listNews.clear();

    final http.Response apiResponse = await http.get(TOP_HEADLINES);
    print(apiResponse);

    if(json.decode(apiResponse.body)['status'] == "ok"){
      final listData = json.decode(apiResponse.body)['articles'];
      print(listData); 

      listData.forEach(
        (data) => listNews.add(News.fromJson(data))
      );

      return listNews;
    }
    else {
      listNews = [];
    }

    

    // await new http.Client()
    // .get(TOP_HEADLINES)
    // .then((response) => response.body)
    // .then(json.decode)
    // .then((json) => json['articles'])
    // .then((news) => news
    //   .forEach((news) => listNews.add(new News.fromJson(news))));
    
    
    // return listNews;
  }
}