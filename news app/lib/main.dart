import 'package:flutter/material.dart';
import 'package:news_app/config/theme/app_themes.dart';
import 'package:news_app/feature/presentation/pages/home/daily_news.dart';
import 'package:news_app/injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const DailyNews(),
      theme: theme(),
      debugShowCheckedModeBanner: false,
    );
  }
}

