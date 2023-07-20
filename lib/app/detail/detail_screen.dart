import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:picture_of_the_day/domain/entities/picture_entity.dart';

class DetailScreen extends StatelessWidget {
  final PictureEntity picture;
  const DetailScreen({super.key, required this.picture});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          picture.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 35),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: picture.url,
                placeholder: (_, __) => const CircularProgressIndicator(),
                errorWidget: (_, __, ___) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              picture.explanation,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
