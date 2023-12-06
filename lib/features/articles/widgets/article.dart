import 'package:cambio_seguro_demo/domain/models/article.dart';
import 'package:cambio_seguro_demo/features/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;

  const ArticleWidget({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.calendar_month, color: Colors.grey.shade600, size: 16),
              const SizedBox(width: 4),
              Text(
                DateFormat.yMMMMd('es').format(article.createdAt),
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Text(
            article.title,
            style: const TextStyle(
              color: Color(0xff1f295c),
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          CustomCachedNetworkImage(
            imageUrl: article.urlImage,
            height: 200,
            width: double.infinity,
          ),
          const SizedBox(height: 8),
          Text(
            article.shortDescription,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
