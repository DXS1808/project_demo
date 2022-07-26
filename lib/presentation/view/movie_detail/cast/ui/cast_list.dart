
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cast_cubit/cast_cubit.dart';
import 'cast_item.dart';

class CreditCastList extends StatefulWidget {
  int movieId;
  CreditCastList({Key? key,required this.movieId}) : super(key: key);

  @override
  State<CreditCastList> createState() => _CreditCastListState();
}

class _CreditCastListState extends State<CreditCastList> {

  @override
  void initState() {
    // TODO: implement initState
    context.read<CreditCastCubit>().get(widget.movieId);
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreditCastCubit,CreditCastState>(builder: (context, state) {
      if(state.creditCastStatus == CreditCastStatus.loading){
        return const Center(
          child: CircularProgressIndicator(color: Colors.white),
        );
      }else if( state.creditCastStatus == CreditCastStatus.success){
        return CreditCastItem(creditCast: state.creditCast!);
      }
      return Container();
    });
  }
}
