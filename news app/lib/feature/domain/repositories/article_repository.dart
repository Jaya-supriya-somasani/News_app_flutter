import 'package:news_app/feature/domain/entities/article.dart';
import 'package:news_app/core/resources/data_state.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
