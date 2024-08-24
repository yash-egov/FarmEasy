import 'package:farmeasy_v1/news/newsmodel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatefulWidget {
  final NewsModel news;
  const NewsCard(this.news, {super.key});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  String getTruncatedDescription(String description) {
    List<String> words = description.split(' ');
    if (words.length > 50) {
      return words.sublist(0, 50).join(' ') + '...';
    } else {
      return description;
    }
  }

  Future<void> _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.news.title!,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              getTruncatedDescription(widget.news.description!),
              style: const TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 10.0),
            InkWell(
              onTap: () {
                _launchURL(widget.news.URL!);
              },
              hoverColor: Colors.green,
              child: Text(
                widget.news.URL!,
                style: const TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
