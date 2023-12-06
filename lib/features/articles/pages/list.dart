import 'package:cambio_seguro_demo/core/constants/constant_color.dart';
import 'package:cambio_seguro_demo/features/articles/bloc/article_bloc.dart';
import 'package:cambio_seguro_demo/features/articles/widgets/article.dart';
import 'package:cambio_seguro_demo/features/articles/widgets/banner.dart';
import 'package:cambio_seguro_demo/features/articles/widgets/bottom_loader.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfiniteScrollPage extends StatefulWidget {
  const InfiniteScrollPage({super.key});

  @override
  State<InfiniteScrollPage> createState() => _InfiniteScrollPageState();
}

class _InfiniteScrollPageState extends State<InfiniteScrollPage> {
  final _scrollController = ScrollController();
  // final _scrollThreshold = 200.0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ArticleBloc>().add(ArticleEvent.doGetArticles());
    });

    _scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  onScroll() {
    if (_scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;

      // print('maxScroll: $maxScroll');
      // print('currentScroll: $currentScroll');

      if (maxScroll == currentScroll) {
        print('load-more');
        context.read<ArticleBloc>().add(ArticleEvent.doGetArticles());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocListener<ArticleBloc, ArticleState>(
      listener: (context, state) {
        (switch (state) {
          ArticleLoadFailed(message: final message) =>
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            ),
          _ => null,
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cambio Seguro',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: ConstantColor.kPrimary,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            )
          ],
        ),
        body: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            return switch (state) {
              ArticleLoaded(
                banner: final banner,
                articles: final articles,
              ) =>
                CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: BannerWidget(banner: banner),
                    ),
                    SliverToBoxAdapter(
                      child: Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                        indent: 25,
                        endIndent: 25,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return index >= articles.length
                              ? const BottomLoader()
                              : ArticleWidget(article: articles[index]);
                        },
                        childCount: state.hasReachedMax
                            ? articles.length
                            : articles.length + 1,
                      ),
                    ),
                  ],
                ),
              ArticleLoading() => CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        List.generate(
                          10,
                          (int index) => const ArticleSkeleton(),
                        ),
                      ),
                    )
                  ],
                ),
              ArticleLoadFailed(message: final message) => Center(
                  child: Text(message),
                ),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    ));
  }
}
