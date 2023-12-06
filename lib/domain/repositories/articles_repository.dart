import 'package:cambio_seguro_demo/core/types/result_future.dart';

import 'package:cambio_seguro_demo/domain/models/response.dart';

abstract class ArticlesRepository {
  ResultFuture<ArticleResponse> getArticles({int page = 1});
}
