
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/presentation/view/movie_detail/reviews/ui/reviews_item.dart';
import '../../../../common/category_text.dart';
import '../reviews_cubit/reviews_cubit.dart';

class ReviewsList extends StatefulWidget {
  final int movieId;

  const ReviewsList({Key? key, required this.movieId}) : super(key: key);

  @override
  State<ReviewsList> createState() => _ReviewsListState();
}

class _ReviewsListState extends State<ReviewsList> {
  @override
  void initState() {
    context.read<ReviewsCubit>().getReviews(widget.movieId);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, ReviewsState>(builder: (context, state) {
      if (state.reviewsStatus == ReviewsStatus.loading) {
        return Container();
      } else if (state.reviewsStatus == ReviewsStatus.success) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CategoryText(
                  category: "Reviews",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                const SizedBox(width: 10.0,),
                CategoryText(
                  category: "${state.results.length}",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                )
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children:
                    state.results.map((e) => ReviewsItem(results: e)).toList(),
              ),
            )
          ],
        );
      }
      return Container();
    });
  }
}
