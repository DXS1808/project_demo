
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    context.read<RecommendationCubit>().get(widget.movieId);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationCubit, RecommendationState>(
        builder: (context, state) {
          if(state.recommendationStatus == RecommendationStatus.loading){
            return Container();
          }else if(state.recommendationStatus == RecommendationStatus.success){
            return RecommendationList(movieListItem: state.movie!.results);
          }
          return Container();
        });
  }
}
