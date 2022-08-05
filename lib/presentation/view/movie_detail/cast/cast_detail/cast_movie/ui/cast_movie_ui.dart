import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project_demo/data/model/cast/cast_career.dart';
import 'package:project_demo/data/model/credit_movie/credit_movie.dart';
import 'package:project_demo/presentation/common/category_text.dart';
import 'package:project_demo/presentation/common/movie_detail_item.dart';

import '../cast_movie_cubit/cast_movie_cubit.dart';

class CastMovieUI extends StatefulWidget {
  int castId;

  CastMovieUI({Key? key, required this.castId}) : super(key: key);

  @override
  _CastMovieUIState createState() => _CastMovieUIState();
}

class _CastMovieUIState extends State<CastMovieUI> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<CastMovieCubit>().getCreditCubit(widget.castId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastMovieCubit, CreditMovieState>(
        builder: (context, state) {
      if (state.creditMovieStatus == CreditMovieStatus.loading) {
        return Container();
      } else if (state.creditMovieStatus == CreditMovieStatus.success) {
        List<CastCareer> listCastCareer = [];
        for (int i = 0; i <= state.castMovie.length - 1; i++) {
          // String dateTime = state.castMovie[i].releaseDate!.length != 10
          //     ? state.castMovie[i].releaseDate!
          //     : "1994-12-16";
          try{
            listCastCareer.add(CastCareer(
                DateFormat("yyyy-MM-dd").parse(state.castMovie[i].releaseDate!),
                state.castMovie[i].character!,
                state.castMovie[i].originalTitle!));
          }catch(e){
            state.castMovie.removeAt(i);
          }
        }
        listCastCareer
            .sort((a, b) => a.dateTime.year.compareTo(b.dateTime.year));
        print("listCastCareer: ${listCastCareer}");
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
                elevation: 5.0,
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoryText(
                        category: "Credit Movie",
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 8.0),
                        height: 220,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: state.castMovie
                                .map((e) => castMovieItem(e))
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 5.0),
              child: CategoryText(
                category: "Cast Career",
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Table(
                border: TableBorder.all(),
                children: listCastCareer.map((e) => castCareerItem(e)).toList(),
              ),
            )
          ],
        );
      }
      return Container();
    });
  }

  Widget castMovieItem(CastMovie castMovie) {
    return SingleChildScrollView(
      child: MovieItemDetail(
        movieListItem: castMovie,
        colorText: Colors.black,
      ),
    );
  }

  TableRow castCareerItem(CastCareer castCareer) {
    return TableRow(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
        child: Row(
          children: [
            Text(
              castCareer.dateTime.year.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
            const SizedBox(
              width: 8.0,
            ),
            const Icon(
              Icons.star,
              color: Colors.black,
              size: 15,
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Text(
                "${castCareer.originTitle} - ${castCareer.character} ",
                softWrap: true,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
            )
          ],
        ),
      )
    ]);
  }
}
