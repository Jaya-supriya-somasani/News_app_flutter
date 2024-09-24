import 'package:news_app/feature/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  final String? sourceName; // Added this for source name

  const ArticleModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.sourceName,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage'] ?? "",
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
      sourceName: map['source']?['name'] ?? "", // Extracting source name
    );
  }
}
