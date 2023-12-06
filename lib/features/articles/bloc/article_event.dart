part of 'article_bloc.dart';

sealed class ArticleEvent extends Equatable {
  const ArticleEvent();

  factory ArticleEvent.doGetArticles() => const GetArticles();

  @override
  List<Object> get props => [];
}

final class GetArticles extends ArticleEvent {
  const GetArticles();

  @override
  List<Object> get props => [];
}
