import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/presentation/common/movie_detail_item.dart';
import 'package:project_demo/presentation/view/movie_detail/similar/similar_cubit/similar_cubit.dart';
import 'package:project_demo/presentation/view/movie_detail/similar/ui/similar_list.dart';

class Similar extends StatefulWidget {
  int movieId;
 Similar({Key? key,required this.movieId}) : super(key: key);

  @override
  _SimilarState createState() => _SimilarState();
}

class _SimilarState extends State<Similar> {

  @override
  void initState() {
    context.read<SimilarCubit>().get(widget.movieId);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarCubit, SimilarState>(
        builder: (context, state) {
          if(state.similarStatus == SimilarStatus.loading){
            return Container();
          }else if(state.similarStatus == SimilarStatus.success){
            return SimilarList(movieListItem: state.movieListItem);
          }
          return Container();
        });
  }
}
