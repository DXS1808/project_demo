import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_demo/config/constants.dart';

class CacheImage extends StatelessWidget {
  final String imgUrl;
  final double heightImage;
  final double widthImage;
  final BoxFit ? fit;
  const CacheImage(this.imgUrl,this.heightImage,this.widthImage, this.fit, {super.key});

  @override
  Widget build(BuildContext context) {
    String url = Constants.imageUrl + imgUrl;
    return CachedNetworkImage(
      imageUrl: url,
      height: heightImage,
      width: widthImage,
      fit: fit ?? BoxFit.fill,
      errorWidget: (context, url, _){
        return  CircleAvatar(
        maxRadius: 40,
          backgroundColor: Colors.grey.withOpacity(0.5),
          child: const Icon(Icons.error,
            color: Colors.red,
            size: 30,
        ));
      },
    );
  }
}
