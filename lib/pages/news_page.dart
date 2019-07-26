import 'package:flutter/material.dart';
import 'package:news/models/Article.dart';
import 'package:news/widgets/article_list.dart';

// SERVICES
import './../services/news_service.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key key}) : super(key: key);

  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Article> articles;
  bool loading = false;
  bool error = false;
  String message = 'Error';

  void getNews(query) async {
    loading = true;
    try {
      List<Article> articles = await NewsService.getNews(query: query);
      setState(() {
        this.articles = articles;
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
        error = true;
      });
    }
  }

  Widget buildArticles(BuildContext context) {
    if (loading)
      return Center(
        child: CircularProgressIndicator(),
      );

    if (error)
      return Center(
        child: Text(message),
      );

    if (articles == null || articles.length == 0)
      return Center(
        child: SizedBox(),
      );

    return ArticleListWidget(
      articles: articles,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Container(
        color: Colors.grey[200],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white
                ),
                margin: EdgeInsets.only(left: 10, right: 10, top: 10,),
                padding: EdgeInsets.all(5),
                child: TextField(
                  style: TextStyle(
                    
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'What are you looking for?',
                  ),
                  onSubmitted: (value) {
                    print(value);
                    getNews(value);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 150,
                child: buildArticles(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
