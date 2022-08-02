import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:project_demo/data/model/favorite/favorite.dart';
import 'package:project_demo/domain/usecase/favorite_usecase.dart';

part 'movie_favorite_state.dart';

class MovieFavoriteCubit extends Cubit<MovieFavoriteState> {
  FavoriteUseCase favoriteUseCase;
  MovieFavoriteCubit(this.favoriteUseCase) : super(MovieFavoriteState());

  void get(String userId) {
    emit(state.copyWith(movieFavoriteStatus: MovieFavoriteStatus.loading));
    Timer(const Duration(seconds: 1), (){
      try{
        final data = Hive.box<Favorite>("favorite_$userId").values.toList();
        emit(state.copyWith(movieFavoriteStatus: MovieFavoriteStatus.success,getListFavorite: data));
      }catch(e){
        emit(state.copyWith(
            movieFavoriteStatus: MovieFavoriteStatus.failed));
      }
    });
  }

  void markFavorite(String userId,int movieId,Favorite favorite)  async {
    try {
      await favoriteUseCase.addFavorite(userId,movieId,favorite);
      final data = Hive.box<Favorite>("favorite_$userId").values.toList().reversed.toList();
      emit(state.copyWith(movieFavoriteStatus: MovieFavoriteStatus.markedSuccess,getListFavorite: data));
    } catch (e) {
      emit(state.copyWith(movieFavoriteStatus: MovieFavoriteStatus.markedFailed));
    }
  }

  void removeFavorite(String userId,int movieId) async{
    try{
      await favoriteUseCase.removeFavorite(userId, movieId);
      final data = Hive.box<Favorite>("favorite_$userId").values.toList();
      print("length: ${data.length}");
      emit(state.copyWith(movieFavoriteStatus: MovieFavoriteStatus.success,getListFavorite: data));
    }catch(e){
      print(e);
    }
  }
  // void checkFavorite(int id,String userId){
  //   try{
  //     List<Favorite> listFavorite = Hive.box<Favorite>("favorite_$userId").values.toList();
  //     if(listFavorite.indexWhere((e) => e.id == id) != -1){
  //       emit(state.copyWith(movieFavoriteStatus: MovieFavoriteStatus.marked));
  //     }else{
  //       emit(state.copyWith(movieFavoriteStatus: MovieFavoriteStatus.notMarked));
  //     }
  //   }catch(e){
  //     print(e);
  //   }
  // }
}
