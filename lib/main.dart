
import 'package:flutter/material.dart';
import 'package:news_api/views/news_home.dart';

void main(){
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      title: "News API",
      home: NewsFeed(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}