import 'package:dio/dio.dart';
import 'package:farmeasy_v1/news/newscard.dart';
import 'package:farmeasy_v1/news/newsmodel.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsModel?> allnews = [];
  Future<List<NewsModel?>> fetchNews() async {
    var dio = Dio();

    var url =
        'https://api.mediastack.com/v1/news?access_key=18f6135d8a5b649a3416beab7f98dcad';

    try {
      // Since this is a GET endpoint, change post to get.
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        // print('Request was successful: ${response.data}');

        // Assuming response.data['data'] is a List of news articles.
        List<dynamic> newsData = response.data['data'];
        List<NewsModel?> news = newsData
            .map((news) =>
                NewsModel(news['title'], news['description'], news['url']))
            .toList();

        // Returning the list of news titles.
        setState(() {
          allnews = news;
        });
        return news;
      } else {
        print('Failed to send request: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while sending request: $e');
    }
    return [];
  }

  @override
  void initState() {
    fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: allnews.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: NewsCard(allnews[index]!),
            );
          },
        ),
      ),
    );
  }
}

/*
 api end point : https://api.mediastack.com/v1/news?access_key=18f6135d8a5b649a3416beab7f98dcad
*/