import 'package:flutter/material.dart';

// PAGES
import './pages/news_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        backgroundColor: Color(0xFFF0F2F5),
        cardColor: Color(0xFFE8F0FE),
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => NewsPage(),
      },
      onUnknownRoute: (RouteSettings settings) {
        /** GO BACK TO THE MAIN PAGE */
        return MaterialPageRoute(
            builder: (BuildContext context) => NewsPage());
      },
    );
  }
}