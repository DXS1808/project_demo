import 'package:flutter/material.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/core/router/router.dart';
import 'package:project_demo/presentation/common/cache_image.dart';
import 'package:project_demo/presentation/common/category_text.dart';
import '../../../../../data/model/cast/cast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreditCastItem extends StatelessWidget {
  final CreditCast creditCast;

  const CreditCastItem({Key? key, required this.creditCast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return creditCast.cast!.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryText(
                category: AppLocalizations.of(context)!.cast,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
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
        Navigator.pushNamed(context, AppRouter.castDetail, arguments: item.id!);
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
                  color: Colors.black,
                  fontFamily: Constants.fontFamily,
                  fontSize: 10,
                ))
          ],
        ),
      ),
    );
  }
}
