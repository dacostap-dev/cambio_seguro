import 'package:cambio_seguro_demo/features/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cambio_seguro_demo/domain/models/banner.dart' as banner_model;

class BannerWidget extends StatelessWidget {
  final banner_model.Banner banner;

  const BannerWidget({
    super.key,
    required this.banner,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '!Nuevo artículo!',
            style: TextStyle(
              color: Color(0xfff7ac17),
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          Text(
            banner.title,
            style: const TextStyle(
              color: Color(0xff1f295c),
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          CustomCachedNetworkImage(
            imageUrl: banner.urlImage,
            height: 200,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
