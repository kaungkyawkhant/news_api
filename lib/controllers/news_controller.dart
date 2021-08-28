import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api/models/new_model.dart';

class NewsController{
  Future<NewsArticle> getNews() async{
    var newsArticle;
    String apiUrl = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=API_KEY";
    try {
      var res = await http.get(Uri.parse(apiUrl));
      if(res.statusCode==200){
        var resJson = jsonDecode(res.body);
        newsArticle = NewsArticle.fromJson(resJson);
      }
      
    } on Exception catch (e) {
      // TODO
      print(e.toString());
      return newsArticle;
    }
    return newsArticle;
    

  }
}