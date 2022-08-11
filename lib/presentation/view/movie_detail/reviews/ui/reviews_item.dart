import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/model/reviews/reviews.dart';
import 'package:project_demo/presentation/common/cache_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_demo/presentation/common/image_url_null.dart';
import 'package:readmore/readmore.dart';

class ReviewsItem extends StatefulWidget {
  Results results;

  ReviewsItem({Key? key, required this.results}) : super(key: key);

  @override
  _ReviewsItemState createState() => _ReviewsItemState();
}

class _ReviewsItemState extends State<ReviewsItem> {
  
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
        Container(
          margin: const EdgeInsets.only(bottom: 8.0),
          padding:const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: Border.all(color:Colors.black,width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10.0))
          ),
          child: authorDetails(widget.results.authorDetails!),
        );
  }

  Widget authorDetails(AuthorDetails authorDetails) {
    var time = DateTime.parse(widget.results.createdAt!);
    var timer = DateFormat('dd/MM/yyyy, HH:mm').format(time);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
            backgroundColor:Colors.white,
            maxRadius: 30,
            child: ClipOval(
              child: authorDetails.avatarPath != null
                  ? CacheImage(authorDetails.avatarPath!, 80, 80, BoxFit.cover)
                  : const ImageUrlNull( Icon(Icons.person), 80, 80),
            )
        ),
        const SizedBox(
          width: 5.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.results.author!,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 12,
                fontFamily: Constants.FONT_FAMILY,
              ),
              ),
              ReadMoreText(
              "${widget.results.content}",
              trimLines: 4,
              trimExpandedText: AppLocalizations.of(context)!.less,
              trimCollapsedText: AppLocalizations.of(context)!.read_more,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: Constants.FONT_FAMILY,
              ),
                moreStyle: const TextStyle(color: Constants.BACKGROUND_COLOR),
                lessStyle: const TextStyle(color: Constants.BACKGROUND_COLOR),
            ),
              Text(timer,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 10,
                fontFamily: Constants.FONT_FAMILY,
              ),
              )

            ],
          )
        )
      ],
    );
  }
}
