import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonScreen extends StatelessWidget {
  const SkeletonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SkeletonLoader(
        highlightColor: Colors.white24,
        baseColor: Colors.grey.withOpacity(0.8),
        items: 10,
        builder: SkeletonItem(
          child: Card(
              color: Colors.white24.withOpacity(0.2),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        height: 150,
                        width: 100,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              maxLength: size.width - 120,
                              height: 20),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              maxLength: size.width - 120,
                              height: 12),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            randomLength: true,
                            height: 12,
                            minLength: MediaQuery.of(context).size.width / 6,
                            maxLength: MediaQuery.of(context).size.width - 120,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const SizedBox(
                          width: 80,
                          child:  SkeletonLine(
                          style: SkeletonLineStyle(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                              height: 12),
                        ),),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const SizedBox(
                          width: 120,
                          child:  SkeletonLine(
                            style: SkeletonLineStyle(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                                height: 12),
                          ),),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children:const  [
                            SkeletonItem(child: Icon(Icons.star,size: 25)),
                            SkeletonItem(child: Icon(Icons.star,size: 25)),
                            SkeletonItem(child: Icon(Icons.star,size: 25)),
                            SkeletonItem(child: Icon(Icons.star,size: 25)),
                            SkeletonItem(child: Icon(Icons.star,size: 25))
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
