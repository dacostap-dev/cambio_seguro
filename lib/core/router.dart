import 'package:cambio_seguro_demo/features/exchange_rate/exchange_rate.dart';
import 'package:cambio_seguro_demo/features/articles/pages/list.dart';
import 'package:cambio_seguro_demo/home.dart';
import 'package:flutter/material.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'home':
      return MaterialPageRoute(builder: (_) => const HomePage());
    case 'exchange-rate':
      return MaterialPageRoute(builder: (_) => const ExchangeRatePage());
    case 'articles':
      return MaterialPageRoute(builder: (_) => const InfiniteScrollPage());
    default:
      throw ('This route nae does not exist');
  }
}
