import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonMovieDetail extends StatelessWidget {
  const SkeletonMovieDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SkeletonLoader(
          highlightColor: Colors.white24,
          baseColor: Colors.grey.withOpacity(0.8),
          items: 1,
          builder: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.grey,
                ),
                height: size.height * 0.5,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const SkeletonLine(
                style: SkeletonLineStyle(
                    height: 25,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              const SizedBox(
                height: 5.0,
              ),
                  SizedBox(
                    width: size.width * 0.5,
                    child: const SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 12,
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    ),

              ),
              const SizedBox(
                height: 3.0,
              ),
                  Container(
                    width: size.width * 0.4,
                    child: const SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 12,
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),

              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: size.width * 0.2,
                        child: const SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 12,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        width: size.width * 0.2,
                        child: const SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 12,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: size.width * 0.3,
                        child: const SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 12,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width/6,
                    child: const SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 25,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    width: size.width/6,
                    child: const SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 25,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    width: size.width/6,
                    child: const SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 25,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              SkeletonLine(
                style: SkeletonLineStyle(
                    height: size.height*0.2,
                    borderRadius:
                    const BorderRadius.all(Radius.circular(10.0))),
              ),
            ],
          )),
    );
  }
}
