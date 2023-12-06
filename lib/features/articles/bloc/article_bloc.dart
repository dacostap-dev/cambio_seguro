import 'package:bloc/bloc.dart';
import 'package:cambio_seguro_demo/domain/models/article.dart';
import 'package:cambio_seguro_demo/domain/models/banner.dart';
import 'package:cambio_seguro_demo/domain/repositories/articles_repository.dart';
import 'package:equatable/equatable.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticlesRepository _articlesRepository;
  int page = 1;
  List<Article> articles = [];

  ArticleBloc(this._articlesRepository) : super(const ArticleInitial()) {
    on<GetArticles>(loadArticles);
  }

  bool _hasReachedMax(ArticleState state) =>
      state is ArticleLoaded && state.hasReachedMax;

  void loadArticles(GetArticles event, Emitter<ArticleState> emit) async {
    if (_hasReachedMax(state)) return;

    if (page == 1) emit(ArticleState.loading());

    final res = await _articlesRepository.getArticles(page: page);

    res.fold(
      (l) => emit(ArticleState.loadFailed(message: l.message)),
      (response) {
        if (response.data.isEmpty) {
          return emit(
            ArticleState.loaded(
              banner: response.banner,
              articles: articles,
              hasReachedMax: true,
            ),
          );
        }

        page++;
        articles.addAll(response.data);
        emit(
          ArticleState.loaded(banner: response.banner, articles: articles),
        );
      },
    );
  }
}
