import 'package:cambio_seguro_demo/domain/models/article.dart';
import 'package:cambio_seguro_demo/domain/models/banner.dart';

class ArticleResponse {
  final bool error;
  final int status;
  final String message;
  final Banner banner;
  final List<Article> data;
  final int total;
  final int rows;
  final int from;
  final int to;
  final int pages;
  final int pageSelected;

  ArticleResponse({
    required this.error,
    required this.status,
    required this.message,
    required this.banner,
    required this.data,
    required this.total,
    required this.rows,
    required this.from,
    required this.to,
    required this.pages,
    required this.pageSelected,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      ArticleResponse(
        error: json["error"],
        status: json["status"],
        message: json["message"],
        banner: Banner.fromJson(json["banner"]),
        data: List<Article>.from(json["data"].map((x) => Article.fromJson(x))),
        total: json["total"],
        rows: json["rows"],
        from: json["from"],
        to: json["to"],
        pages: json["pages"],
        pageSelected: json["pageSelected"],
      );
}
