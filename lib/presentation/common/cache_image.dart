import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_demo/config/constants.dart';

class CacheImage extends StatelessWidget {
  final String imgUrl;
  final double heightImage;
  final double widthImage;
  final BoxFit ? fit;
  CacheImage(this.imgUrl,this.heightImage,this.widthImage, this.fit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = Constants.IMAGE_URL + imgUrl;
    return CachedNetworkImage(imageUrl: url,
      height: heightImage,
      width: widthImage,
      fit: fit ?? BoxFit.fill,
      errorWidget: (context, url, _){
        return const Icon(Icons.error,
        color: Colors.red,
          size: 30,
        );
      },
    );
  }
}
