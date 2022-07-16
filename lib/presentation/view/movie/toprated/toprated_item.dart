// import 'package:flutter/cupertino.dart';
// import 'package:project_demo/data/model/movie.dart';
// import 'package:project_demo/presentation/common/cache_image.dart';
//
// import '../../../../config/constants.dart';
//
// class TopRatedItem extends StatelessWidget {
//   MovieListItem movieListItem;
//
//   TopRatedItem({Key? key, required this.movieListItem}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     String imageUrl = Constants.IMAGE_URL + movieListItem.posterPath!;
//     return Container(
//       padding: const EdgeInsets.all(8.0),
//         child: ClipRRect(
//           borderRadius:const BorderRadius.all(Radius.circular(10.0)),
//             child:
//                 CacheImage(movieListItem.posterPath!, 350, 250, BoxFit.cover)));
//   }
// }
