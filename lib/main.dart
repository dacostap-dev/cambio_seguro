import 'package:cambio_seguro_demo/core/router.dart';
import 'package:cambio_seguro_demo/data/repositories/articles_respository_impl.dart';
import 'package:cambio_seguro_demo/domain/repositories/articles_repository.dart';
import 'package:cambio_seguro_demo/features/articles/bloc/article_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    RepositoryProvider<ArticlesRepository>(
      create: (context) => ArticlesRepositoryImpl(),
      child: BlocProvider(
        create: (context) => ArticleBloc(
          context.read(),
        ),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        //GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      onGenerateRoute: onGenerateRoute,
      initialRoute: 'home',
    );
  }
}
