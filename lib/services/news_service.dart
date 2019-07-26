import 'package:dio/dio.dart';
import 'package:news/models/Article.dart';

class NewsService {

  static String apiKey = 'ba026b63b21c47eb8f7cdbad6163265b';

  static getNews({String query, int page = 1, int pageSize = 40}) async {
    try {
      Response response = await Dio().get("https://newsapi.org/v2/everything?q=$query&pageSize=$pageSize&page=$page&apiKey=$apiKey");
      // print(response.data['articles'][0]);

      List<Article> articles = [];

      if(response.data['articles'] != null && response.data['articles'].length > 0) {

        print('get articles');

        response.data['articles'].forEach((article) {
          articles.add(new Article.fromJson(article));
        });

        print('articles got');

        print(articles);

        return articles;

      }

    } catch (e) {
      print('errors found');
      print(e);
      return null;
    }
  }

}
