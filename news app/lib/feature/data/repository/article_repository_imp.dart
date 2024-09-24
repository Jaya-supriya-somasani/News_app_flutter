import 'dart:io';
import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/feature/data/data_sources/local/app_database.dart';
import 'package:news_app/feature/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/feature/data/models/article.dart';
import 'package:news_app/feature/domain/entities/article.dart';
import 'package:news_app/feature/domain/repositories/article_repository.dart';

class ArticleRepositoryImp implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDataBase _appDatabase;
  ArticleRepositoryImp(this._newsApiService,this._appDatabase);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final articlesData = httpResponse.response.data['articles'] as List;
        // Convert the list of dynamic to a list of ArticleModel
        final articles = articlesData
            .map((article) => ArticleModel.fromJson(article))
            .toList();
        return DataSuccess(articles);
      } else {
        return DataFailed(
          DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.unknown,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleEntity>> getSavedArticles() {
    return _appDatabase.articleDao.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDao.deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDao.insertArticle(ArticleModel.fromEntity(article));
  }
}