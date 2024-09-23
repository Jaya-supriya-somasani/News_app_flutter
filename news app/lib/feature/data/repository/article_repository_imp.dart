import 'dart:io';
import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/feature/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/feature/data/models/article.dart';
import 'package:news_app/feature/domain/repositories/article_repository.dart';

class ArticleRepositoryImp implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImp(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
            DioError(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioExceptionType.unknown,
                requestOptions: httpResponse.response.requestOptions
            )
        );
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}