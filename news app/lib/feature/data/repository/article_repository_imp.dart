import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/feature/data/models/article.dart';
import 'package:news_app/feature/domain/repositories/article_repository.dart';

class ArticleRepositoryImp implements ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    throw UnimplementedError();
  }
}
