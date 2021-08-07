

import 'package:digishop/models/category.dart';
import 'package:digishop/models/news.dart';
import 'package:http/http.dart';
import 'dart:convert';

class JsonParser {


  List<News?> getParseNews (Response response){

    dynamic jsonParsed = json.decode(response.body);
    List data = jsonParsed;

    List<News?> newsList = [];

    data.forEach((element) {

      Map obj = element;

      String id = obj["id"];
      String title = obj["title"];
      String icon = obj["icon"];
      String type = obj["type"];
      String link = obj["link"];

      newsList.add(new News(id, title, icon, type, link));

    });

    return newsList;

  }


  List<Category?> getParseCategories (Response response){

    dynamic jsonParsed = json.decode(response.body);
    List data = jsonParsed;

    List<Category?> catList = [];

    data.forEach((element) {

      Map obj = element;

      String id = obj["id"];
      String title = obj["title"];
      String icon = obj["icon"];
      String description = obj["description"];

      catList.add(new Category(id, title, icon , description));

    });

    return catList;

  }


/*

  List<Video?> getParseVideos (Response response){

    dynamic jsonParsed = json.decode(response.body);
    List data = jsonParsed;

    List<Video?> videoList = [];

    data.forEach((element) {

      Map obj = element;

      String id = obj["id"];
      String cat_id = obj["cat_id"];
      String title = obj["title"];
      String icon = obj["icon"];
      String creator = obj["creator"];
      String description = obj["description"];
      String link = obj["link"];
      String view = obj["view"];
      String time = obj["time"];
      String special = obj["special"];

      videoList.add(new Video(id, cat_id, title, icon, creator, description, link, view, time, special));

    });

    return videoList;

  }
*/


}