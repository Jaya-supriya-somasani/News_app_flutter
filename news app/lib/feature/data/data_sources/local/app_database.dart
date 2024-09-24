import 'package:floor/floor.dart';
import 'package:news_app/feature/data/data_sources/local/dao/article_dao.dart';
import 'package:news_app/feature/data/models/article.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDataBase extends FloorDatabase{
  ArticleDao get articleDao;
}