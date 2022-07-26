import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_demo/data/model/movie_image/movie_image.dart';
import 'package:project_demo/presentation/common/cache_image.dart';

class ImageItem extends StatelessWidget {
  Backdrops backdrops;
  ImageItem({Key? key,required this.backdrops}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color:Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: CacheImage(backdrops.filePath!, 100, 150, BoxFit.cover),
      ),
    );
  }
}
