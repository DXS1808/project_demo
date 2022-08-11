import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/presentation/common/movie_detail_item.dart';
import 'package:project_demo/presentation/view/movie_detail/similar/similar_cubit/similar_cubit.dart';
import 'package:project_demo/presentation/view/movie_detail/similar/ui/similar_list.dart';

import '../../../../../data/model/movie/movie.dart';

class Similar extends StatefulWidget {
  int movieId;
 Similar({Key? key,required this.movieId}) : super(key: key);

  @override
  _SimilarState createState() => _SimilarState();
}

class _SimilarState extends State<Similar> {

  @override
  void initState() {
    context.read<SimilarCubit>().get(widget.movieId,false,1);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<MovieListItem> listSimilar = [];
    return BlocConsumer<SimilarCubit, SimilarState>(
      builder: (context, state) {
        return state.similarStatus == SimilarStatus.loading
            ? Container()
            : SimilarList(movieListItem: listSimilar);
      },
      listener: (context, state) {
        if(state.similarStatus == SimilarStatus.success){
          listSimilar = state.movieListItem;
        }else if(state.similarStatus == SimilarStatus.isLoading){
          listSimilar.addAll(state.movieListItem);
        }
      },
    );
  }
}
