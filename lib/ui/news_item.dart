import 'package:flutter/material.dart';
import 'package:news_app/models/news_data_response.dart';

class NewsItem extends StatelessWidget {
  Articles article;
  NewsItem({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(18),
        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(article.urlToImage ?? "",height: 240,)),
          Text(
            article.source?.name ?? "",
            style: TextStyle(fontSize: 12, color: Colors.black45),
          ),
          Text(
            article.title ?? "",
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
          Text(
            article.description ?? "",
            style: TextStyle(fontSize: 14, color: Colors.grey),
            maxLines: 3,
          ),
          Text(
            article.publishedAt?.substring(0, 10) ?? "",
            style: TextStyle(fontSize: 16, color: Colors.black45),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
