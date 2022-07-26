import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/core/router/router.dart';
import 'package:project_demo/data/impl/cast_detail_impl.dart';
import 'package:project_demo/data/model/cast/cast_detail.dart';
import 'package:project_demo/domain/usecase/cast_detail_usecase.dart';
import 'package:project_demo/presentation/common/cache_image.dart';
import 'package:project_demo/presentation/common/category_text.dart';
import 'package:project_demo/presentation/common/ultis/rest_client_dio.dart';
import 'package:project_demo/presentation/view/movie_detail/cast/cast_detail/cast_detail_cubit/cast_detail_cubit.dart';
import 'package:project_demo/presentation/view/movie_detail/cast/cast_detail/ui/cast_detail_screen.dart';
import '../../../../../data/model/cast/cast.dart';

class CreditCastItem extends StatelessWidget {
  CreditCast creditCast;

  CreditCastItem({Key? key, required this.creditCast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return creditCast.cast!.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryText(
                category: 'Cast',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              castList(creditCast.cast!, context),
            ],
          )
        : Container();
  }

  Widget castList(List<Cast> cast, BuildContext context) {
    List<Widget> castList =
        cast.map((e) => (creditCastItem(e, context))).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: castList),
    );
  }

  Widget creditCastItem(Cast item, BuildContext context) {
    return GestureDetector(
      onTap: () {
          Navigator.pushNamed(context, AppRouter.CAST_DETAIL,arguments: item.id!);

      },
      child: Container(
        height: 220,
        width: 120,
        padding: const EdgeInsets.only(right: 5.0, top: 5.0),
        child: Column(
          children: [
            item.profilePath != null
                ? ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child:
                        CacheImage(item.profilePath!, 150, 100, BoxFit.cover),
                  )
                : Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.grey),
                    height: 150,
                    width: 100,
                    child: const Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
            Text(item.originalName!,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: Constants.FONT_FAMILY,
                  fontSize: 10,
                ))
          ],
        ),
      ),
    );
  }
}
