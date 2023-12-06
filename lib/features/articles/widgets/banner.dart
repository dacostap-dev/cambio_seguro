import 'package:cambio_seguro_demo/features/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final String title;
  final String imageUrl;

  const BannerWidget({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '!Nuevo articulo!',
            style: TextStyle(
              color: Color(0xfff7ac17),
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xff1f295c),
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          CustomCachedNetworkImage(
            imageUrl: imageUrl,
            height: 200,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
