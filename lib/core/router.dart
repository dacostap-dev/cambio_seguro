import 'package:cambio_seguro_demo/presentation/pages/home/home.dart';
import 'package:flutter/material.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'home':
      return MaterialPageRoute(builder: (_) => const HomePage());
    case 'list':
      return MaterialPageRoute(builder: (_) => const HomePage());
    default:
      throw ('This route nae does not exist');
  }
}
