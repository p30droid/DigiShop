

import 'package:digishop/models/category.dart';
import 'package:digishop/models/news.dart';
import 'package:digishop/ui/utility/constants.dart';
import 'package:digishop/ui/utility/json_parser.dart';
import 'package:http/http.dart';

class ApiCaller {


  Future<List<News?>> getNews() async {

    List<News?> data = [] ;


    Response response = await get(Uri.parse(Constants.GET_NEWS));

    print(response.statusCode);
    print('response.body');
    print('response.body');
    data = JsonParser().getParseNews(response);

    print(data);

    return data;
  }


  Future<List<Category?>> getCategories() async {

    List<Category?> data = [] ;


    Response response = await get(Uri.parse(Constants.GET_CATEGORIES));

    print(response.statusCode);
    print('response.body');
    data = JsonParser().getParseCategories(response);

    print(data);

    return data;
  }






}