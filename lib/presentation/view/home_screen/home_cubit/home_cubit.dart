import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/model/movie/movie.dart';
import 'package:project_demo/domain/usecase/movie_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  MovieUseCase movieUseCase;

  HomeCubit(this.movieUseCase) : super(HomeState());
  void getPopularList(bool isLoading,page) async {
    if(isLoading == false){
      emit(state.copyWith(homeStatus: HomeStatus.loading));
    }
    Timer(const Duration(milliseconds: 200),()async{
      try {
        List<MovieListItem> popularListOld = [];
        if(isLoading == false){
          final data = await movieUseCase.getListPopular(Constants.API_KEY,1);
          popularListOld.addAll(data.results);
          emit(state.copyWith(homeStatus: HomeStatus.getPopularList,popularList:popularListOld));
        }
        if(isLoading == true){
          await movieUseCase.getListPopular(Constants.API_KEY,page).then((value) {
            popularListOld.addAll(value.results);
            emit(state.copyWith(homeStatus: HomeStatus.getPopularListLoading,popularList: popularListOld));
          }
          );
        }
      } catch (e) {
        print(e);
        // emit(state.copyWith(homeStatus: HomeStatus.failed));
      }
    });
  }

  void getTopRatedList(bool isLoading,page) async {
      if(isLoading == false){
        emit(state.copyWith(homeStatus: HomeStatus.loading));
      }
   Timer(const Duration(milliseconds: 200),()async{
     try {
       List<MovieListItem> topRatedListOld = [];
       if(isLoading == false){
         final data = await movieUseCase.getListTopRated(Constants.API_KEY,1);
         topRatedListOld.addAll(data.results);
         emit(state.copyWith(homeStatus: HomeStatus.getTopRatedList,topRatedList: topRatedListOld));
       }
       if(isLoading == true){
         await movieUseCase.getListTopRated(Constants.API_KEY,page).then((value) {
           topRatedListOld.addAll(value.results);
           emit(state.copyWith(homeStatus: HomeStatus.getTopRatedListLoading,topRatedList: topRatedListOld));
         }
         );
       }
     } catch (e) {
       print(e);
     }
   });
  }

  void getNowPlayingList(bool isLoading,page) async {
    if(isLoading == false){
      emit(state.copyWith(homeStatus: HomeStatus.loading));
    }
   Timer(const Duration(milliseconds: 200),() async {
     try {
       List<MovieListItem> nowPlayingListOld = [];
       if(isLoading == false){
         final data = await movieUseCase.getListNowPlaying(Constants.API_KEY,1);
         nowPlayingListOld.addAll(data.results);
         emit(state.copyWith(homeStatus: HomeStatus.getNowPlayingList,nowPlayingList: nowPlayingListOld));
       }
       if(isLoading == true){
         await movieUseCase.getListNowPlaying(Constants.API_KEY,page).then((value) {
           nowPlayingListOld.addAll(value.results);
           emit(state.copyWith(homeStatus: HomeStatus.getNowPlayingListLoading,nowPlayingList: nowPlayingListOld));
         }
         );
       }
     } catch (e) {
       emit(state.copyWith(homeStatus: HomeStatus.failed));
     }
   });
  }

  void getUpComingList(bool isLoading,page) async {
    if(isLoading == false){
      emit(state.copyWith(homeStatus: HomeStatus.loading));
    }
    Timer(const Duration(milliseconds: 200),()async{
      try {
        List<MovieListItem> upComingListOld = [];
        if(isLoading == false){
          final data = await movieUseCase.getListUpComing(Constants.API_KEY,1);
          upComingListOld.addAll(data.results);
          emit(state.copyWith(homeStatus: HomeStatus.getUpComing,upComingList: upComingListOld));
        }
        if(isLoading == true){
          await movieUseCase.getListUpComing(Constants.API_KEY,page).then((value) {
            upComingListOld.addAll(value.results);
            emit(state.copyWith(homeStatus: HomeStatus.getUpComingLoading,upComingList: upComingListOld));
          }
          );
        }
      } catch (e) {
        emit(state.copyWith(homeStatus: HomeStatus.failed));
      }
    });
  }

  void getSearchMovieList(String query) async{
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    Timer(const Duration(milliseconds: 100),()async{
      try {
        final data = await movieUseCase.getSearchMovie(Constants.API_KEY,query);
        emit(state.copyWith(
            homeStatus: HomeStatus.getSearchMovie, searchMovieList: data.results));
      } catch (e) {
        emit(state.copyWith(homeStatus: HomeStatus.failed));
      }
    });

  }

  void checkSearch(bool check){
    emit(state.copyWith(checkSearch: check));
  }
}
