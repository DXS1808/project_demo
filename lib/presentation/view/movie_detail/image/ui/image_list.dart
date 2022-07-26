import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/presentation/common/category_text.dart';
import 'package:project_demo/presentation/view/movie_detail/image/image_cubit/image_cubit.dart';
import 'package:project_demo/presentation/view/movie_detail/image/ui/image_item.dart';

class ImageList extends StatefulWidget {
  int movieId;

  ImageList({Key? key, required this.movieId}) : super(key: key);

  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  @override
  void initState() {
    context.read<ImageCubit>().getMovieImage(widget.movieId);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(builder: (context, state) {
      if (state.imageStatus == ImageStatus.loading) {
        return Container();
      } else if (state.imageStatus == ImageStatus.success) {
        return state.movieImage!.backdrops!.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryText(
                    category: "Image Movie",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: state.movieImage!.backdrops!
                          .map((e) => ImageItem(backdrops: e))
                          .toList(),
                    ),
                  )
                ],
              )
            : Container();
      }
      return Container();
    });
  }
}
