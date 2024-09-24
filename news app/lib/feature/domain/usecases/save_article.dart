import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/feature/domain/entities/article.dart';
import 'package:news_app/feature/domain/repositories/article_repository.dart';

class SaveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.saveArticle(params!);
  }
}
