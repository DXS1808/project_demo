import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/data/model/cast/cast_career.dart';
import 'package:project_demo/data/model/credit_movie/credit_movie.dart';
import 'package:project_demo/presentation/common/category_text.dart';
import 'package:project_demo/presentation/common/movie_detail_item.dart';
import '../../../../../../../utils/string_ultis.dart';
import '../cast_movie_cubit/cast_movie_cubit.dart';

class CastMovieUI extends StatefulWidget {
  final int castId;

  const CastMovieUI({Key? key, required this.castId}) : super(key: key);

  @override
  CastMovieUIState createState() => CastMovieUIState();
}

class CastMovieUIState extends State<CastMovieUI> {
  @override
  void initState() {
    super.initState();
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
          try {
            listCastCareer.add(CastCareer(
                StringUltis.convertDateTime(state.castMovie[i].releaseDate!),
                state.castMovie[i].character!,
                state.castMovie[i].originalTitle!));
          } catch (e) {
            state.castMovie.removeAt(i);
          }
        }
        listCastCareer
            .sort((a, b) => a.dateTime.year.compareTo(b.dateTime.year));
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
                      const CategoryText(
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
              child: const CategoryText(
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
