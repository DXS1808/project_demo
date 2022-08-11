import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/data/model/movie/movie.dart';
import 'package:project_demo/presentation/view/movie_detail/recommendation/recommendation_cubit/recommendation_cubit.dart';
import 'package:project_demo/presentation/view/movie_detail/recommendation/ui/recommendation_list.dart';

class Recommendations extends StatefulWidget {
  int movieId;

  Recommendations({Key? key, required this.movieId}) : super(key: key);

  @override
  _RecommendationsState createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  @override
  void initState() {
    context.read<RecommendationCubit>().get(widget.movieId, false, 1);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<MovieListItem> listRecommendation = [];
    return BlocConsumer<RecommendationCubit, RecommendationState>(
      builder: (context, state) {
        return state.recommendationStatus == RecommendationStatus.loading
            ? Container()
            : RecommendationList(movieListItem: listRecommendation);
      },
      listener: (context, state) {
        if(state.recommendationStatus == RecommendationStatus.success){
          listRecommendation = state.movieListItem;
        }else if(state.recommendationStatus == RecommendationStatus.isLoading){
          listRecommendation.addAll(state.movieListItem);
        }
      },
    );
  }
}
