import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/data/model/image_person/cast_image.dart';
import 'package:project_demo/presentation/common/cache_image.dart';
import 'package:project_demo/presentation/common/category_text.dart';

import '../cast_image_cubit/cast_image_cubit.dart';

class CastImageScreen extends StatefulWidget {
  final int castId;

  const CastImageScreen({Key? key, required this.castId}) : super(key: key);

  @override
  CastImageScreenState createState() => CastImageScreenState();
}

class CastImageScreenState extends State<CastImageScreen> {
  @override
  void initState() {
    context.read<CastImageCubit>().getProfiles(widget.castId);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastImageCubit, CastImageState>(
        builder: (context, state) {
      if (state.castImageStatus == CastImageStatus.loading) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.tealAccent,
          ),
        );
      } else if (state.castImageStatus == CastImageStatus.success) {
        return state.profiles.isNotEmpty
            ? Card(
                elevation: 5.0,
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CategoryText(
                        category: "Cast Image",
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      Wrap(
                        children: state.profiles
                            .map((e) => castImageItem(e, context))
                            .toList(),
                      )
                    ],
                  ),
                ),
              )
            : Container();
      }
      return Container();
    });
  }

  Widget castImageItem(Profiles profiles, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(1.0),
      child:
          CacheImage(profiles.filePath!, 150, size.width / 3 - 8, BoxFit.cover),
    );
  }
}
