import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:news_app/feature/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/feature/data/repository/article_repository_imp.dart';
import 'package:news_app/feature/domain/repositories/article_repository.dart';
import 'package:news_app/feature/domain/usecases/get_article.dart';
import 'package:news_app/feature/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());
  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImp(sl()));

  //useCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
}
