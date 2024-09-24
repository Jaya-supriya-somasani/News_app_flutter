import 'package:floor/floor.dart';
import 'package:news_app/feature/data/models/article.dart';
import 'package:news_app/feature/domain/entities/article.dart';

@dao
abstract class ArticleDao{
  @Insert()
  Future<void> insertArticle(ArticleModel articleModel);

  @delete
  Future<void> deleteArticle(ArticleModel article);

  @Query("Select * from article")
  Future<List<ArticleModel>> getArticles();
}