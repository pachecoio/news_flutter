import 'package:flutter/material.dart';
import 'package:news/models/Article.dart';

import 'package:url_launcher/url_launcher.dart';

class ArticleWidget extends StatefulWidget {
  final Article article;
  ArticleWidget({Key key, this.article}) : super(key: key);

  _ArticleWidgetState createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  _launchURL(String url) async {
    try {
      await launch(url);
    } catch (e) {
      print('not able to lauch the url $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Posted at ${widget.article.publishedAt.day.toString()}/${widget.article.publishedAt.month.toString()}',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.network(
                  widget.article.urlToImage,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(widget.article.title),
              ],
            ),
          ),
          onTap: () {
            _launchURL(widget.article.url);
          },
        ),
      ),
    );
  }
}
