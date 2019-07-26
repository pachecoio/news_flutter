import 'package:flutter/material.dart';
import 'package:news/models/Article.dart';
import 'package:news/widgets/article.dart';

class ArticleListWidget extends StatefulWidget {
  final List<Article> articles;
  ArticleListWidget({Key key, this.articles}) : super(key: key);

  _ArticleListWidgetState createState() => _ArticleListWidgetState();
}

class _ArticleListWidgetState extends State<ArticleListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.articles.length,
      itemBuilder: (BuildContext context, int index) => ArticleWidget(
            article: widget.articles[index],
          ),
    );
  }
}
