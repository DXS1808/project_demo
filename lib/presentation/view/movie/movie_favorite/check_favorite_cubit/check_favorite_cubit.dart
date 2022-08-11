import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../../../data/model/favorite/favorite.dart';

part 'check_favorite_state.dart';

class CheckFavoriteCubit extends Cubit<CheckFavoriteState> {
  CheckFavoriteCubit() : super(CheckFavoriteState());

  void checkFavorite(int id,String userId){
    try{

      List<Favorite> listFavorite = Hive.box<Favorite>("favorite_$userId").values.toList();
      if(listFavorite.indexWhere((e) => e.id == id) != -1){
        emit(state.copyWith(checkFavoriteStatus: CheckFavoriteStatus.marked,id: id));
      }else{
        emit(state.copyWith(checkFavoriteStatus: CheckFavoriteStatus.notMarked,id: id));
      }
    }catch(e){
      print(e);
    }
  }
}
