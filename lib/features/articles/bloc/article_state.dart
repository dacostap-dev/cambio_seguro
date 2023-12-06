part of 'article_bloc.dart';

sealed class ArticleState extends Equatable {
  const ArticleState();

  factory ArticleState.initial() => const ArticleInitial();
  factory ArticleState.loading() => const ArticleLoading();
  factory ArticleState.loaded({
    required Banner banner,
    required List<Article> articles,
    bool hasReachedMax = false,
  }) =>
      ArticleLoaded(
          banner: banner, articles: articles, hasReachedMax: hasReachedMax);
  factory ArticleState.loadFailed({required String message}) =>
      ArticleLoadFailed(message);

  @override
  List<Object> get props => [];
}

final class ArticleInitial extends ArticleState {
  const ArticleInitial();
}

final class ArticleLoading extends ArticleState {
  const ArticleLoading();
}

final class ArticleLoaded extends ArticleState {
  final Banner banner;
  final List<Article> articles;
  final bool hasReachedMax;

  const ArticleLoaded({
    required this.banner,
    required this.articles,
    required this.hasReachedMax,
  });

  @override
  List<Object> get props => [banner, articles, hasReachedMax];
}

final class ArticleLoadFailed extends ArticleState {
  final String message;
  const ArticleLoadFailed(this.message);

  @override
  List<Object> get props => [message];
}
