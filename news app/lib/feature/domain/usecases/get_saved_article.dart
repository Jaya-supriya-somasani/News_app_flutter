
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/feature/domain/entities/article.dart';
import 'package:news_app/feature/domain/repositories/article_repository.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>,void>{
  
  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);
  
  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
  
}