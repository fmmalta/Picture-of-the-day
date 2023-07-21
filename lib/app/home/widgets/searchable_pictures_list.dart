import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:picture_of_the_day/domain/entities/picture_entity.dart';
import 'package:searchable_listview/searchable_listview.dart';

class SearchablePicturesList extends StatelessWidget {
  final List<PictureEntity> pictures;
  const SearchablePicturesList(this.pictures, {super.key});

  @override
  Widget build(BuildContext context) {
    return SearchableList<PictureEntity>.seperated(
      seperatorBuilder: (context, index) => const Divider(),
      initialList: pictures,
      autoFocusOnSearch: false,
      inputDecoration: const InputDecoration(
        labelText: "Pesquise aqui",
        fillColor: Colors.white,
      ),
      filter: (query) => pictures
          .where((picture) =>
              picture.title.toLowerCase().contains(query.toLowerCase()) ||
              DateFormat("dd/MM/yyyy").format(picture.date).contains(query))
          .toList(),
      builder: (picture) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              width: 200.w,
              height: 250.h,
              fit: BoxFit.cover,
              imageUrl: picture.url,
              placeholder: (_, __) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (_, __, ___) => const Icon(Icons.error),
            ),
          ),
          title: Text(
            picture.title,
            style: TextStyle(
              fontSize: 42.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            DateFormat('dd/MM/yyyy').format(picture.date),
            style: TextStyle(fontSize: 30.sp),
          ),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.of(context).pushNamed('/detail', arguments: picture);
          },
        );
      },
    );
  }
}
