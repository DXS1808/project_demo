
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/impl/cast_detail_impl.dart';
import 'package:project_demo/data/model/cast/cast_detail.dart';
import 'package:project_demo/domain/usecase/cast_detail_usecase.dart';
import 'package:project_demo/presentation/common/cache_image.dart';
import 'package:project_demo/presentation/common/category_text.dart';
import 'package:project_demo/presentation/common/custorm_clipper.dart';
import 'package:project_demo/presentation/view/movie_detail/cast/cast_detail/cast_detail_cubit/cast_detail_cubit.dart';
import 'package:project_demo/presentation/view/movie_detail/cast/cast_detail/cast_image/cast_image_cubit/cast_image_cubit.dart';
import 'package:readmore/readmore.dart';
import '../../../../../../utils/rest_client_dio.dart';
import '../cast_image/ui/cast_image_ui.dart';
import '../cast_movie/cast_movie_cubit/cast_movie_cubit.dart';
import '../cast_movie/ui/cast_movie_ui.dart';

class CastDetailScreen extends StatefulWidget {
  final int personId;

  const CastDetailScreen({Key? key, required this.personId}) : super(key: key);

  @override
  CastDetailScreenState createState() => CastDetailScreenState();
}

class CastDetailScreenState extends State<CastDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<CastDetailCubit>().getCastDetail(widget.personId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastDetailCubit, CastDetailState>(
        builder: (context, state) {
      if (state.castDetailStatus == CastDetailStatus.loading) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      } else if (state.castDetailStatus == CastDetailStatus.success) {
        return Scaffold(
          backgroundColor: Colors.white,
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading:Container(
              padding: const EdgeInsets.all(5.0),
              child: CircleAvatar(
                maxRadius: 20,
                backgroundColor: Colors.grey.withOpacity(0.5),
                child: IconButton(
                  onPressed: (){
                    Navigator.of(context,rootNavigator: true).pop();
                  },
                  icon: const Icon(Icons.arrow_back,color: Constants.backgroundColor,),
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
          ),
          body: profileCast(state.castDetail!, context),
        );
      }
      return Container();
    });
  }

  Widget profileCast(CastDetail castDetail, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             ClipPath(
               clipper: Customshape(),
               child:  Container(
                 height: 200,
                 decoration: const BoxDecoration(
                     color: Constants.backgroundColor,
                 ),
               ),
             ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    castDetail.name!,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: Constants.fontFamily,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              if (castDetail.placeOfBirth != null)
                information(Icons.location_on, castDetail.placeOfBirth!),
              const SizedBox(
                height: 5.0,
              ),
              if (castDetail.birthday != null)
                information(Icons.cake_rounded, castDetail.birthday!),
              const SizedBox(
                height: 5.0,
              ),
              if (castDetail.knownForDepartment != null)
                information(Icons.movie, castDetail.knownForDepartment!),
              const SizedBox(
                height: 10.0,
              ),
              if (castDetail.biography!.isNotEmpty)
                Card(
                  elevation: 5.0,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          const CategoryText(
                            category: "Biography",
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ReadMoreText(
                          castDetail.biography!,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                          moreStyle: const TextStyle(color: Constants.backgroundColor),
                          lessStyle: const TextStyle(color: Constants.backgroundColor),
                          trimCollapsedText: 'Read more',
                          trimExpandedText: 'Less',
                        )
                      ],
                    ),
                  ),
                ),
              BlocProvider(
                create: (context) => CastImageCubit(CastDetailUseCase(
                    CastDetailImpl(RestClientDio.restClient))),
                child: CastImageScreen(castId: castDetail.id!),
              ),
              BlocProvider(
                create: (context) => CastMovieCubit(CastDetailUseCase(
                    CastDetailImpl(RestClientDio.restClient))),
                child: CastMovieUI(castId: castDetail.id!),
              )
            ],
          ),
          Positioned(
              top: 100,
              left: size.width * 0.5 - 70,
              child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  child: castDetail.profilePath != null
                      ? ClipOval(
                          child: CacheImage(
                              castDetail.profilePath!, 140, 140, BoxFit.cover),
                        )
                      : const Icon(
                          Icons.person,
                          color: Colors.grey,
                          size: 40,
                        )))
        ],
      ),
    );
  }

  Widget information(IconData icon, String information) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Constants.backgroundColor, size: 20),
        const SizedBox(
          width: 3.0,
        ),
        Text(
          information,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: Constants.fontFamily,
              fontWeight: Constants.textFontWeight),
        )
      ],
    );
  }


}
