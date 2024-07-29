import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_zone/features/home/presentation/widgets/book_image_error.dart';
import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  final String imageUrl;
  const BookImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.4 / 2.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          errorWidget: (context, url, error) => const BookImageError(),
          fit: BoxFit.cover,
          repeat: ImageRepeat.noRepeat,
        ),
      ),
    );
  }
}
