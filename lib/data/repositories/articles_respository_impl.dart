import 'package:cambio_seguro_demo/core/api/dio.dart';
import 'package:cambio_seguro_demo/core/errors/exceptions.dart';
import 'package:cambio_seguro_demo/core/errors/failure.dart';
import 'package:cambio_seguro_demo/core/types/result_future.dart';

import 'package:cambio_seguro_demo/domain/models/response.dart';
import 'package:cambio_seguro_demo/domain/repositories/articles_repository.dart';
import 'package:dartz/dartz.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  final dio = Api.instance.dio;

  @override
  ResultFuture<ArticleResponse> getArticles({int page = 1}) async {
    try {
      final res = await dio.get('/config/articles?page=$page');

      return Right(ArticleResponse.fromJson(res.data));
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    } catch (e) {
      //Si hay otro error por ejemplo de parseo y no tiene code
      return Left(ApiFailure(message: e.toString(), statusCode: 505));
    }
  }
}
