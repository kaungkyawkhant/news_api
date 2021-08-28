import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_api/controllers/news_controller.dart';
import 'package:news_api/models/new_model.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  late Future<NewsArticle> _newsArticles;

  @override
  void initState() {
    // TODO: implement initState
    _newsArticles = NewsController().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {},
          child: Icon(Icons.menu),
        ),
        title: Center(child: Text("News Feeds")),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.search),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.more_vert),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: FutureBuilder<NewsArticle>(
        future: _newsArticles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.articles!.length,
                itemBuilder: (context, index) {
                  var article = snapshot.data!.articles![index];
                  var dateTimeFormat = DateFormat('dd MMM - HH:mm')
                      .format(article.publishedAt!.toUtc());
                  return Container(
                    height: 100,
                    margin: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                article.urlToImage.toString(),
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(width: 8,),
                        Flexible(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(dateTimeFormat),
                            Text(
                              article.title.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              article.description.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ))
                      ],
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
