import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonMovieDetail extends StatelessWidget {
  const SkeletonMovieDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SkeletonLoader(
            highlightColor: Colors.white24,
            baseColor: Colors.grey.withOpacity(0.8),
            items: 1,
            builder: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.55,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                        ),
                        height: 250,
                      ),
                      Positioned(
                        top: 200,
                        child: headerLoad(context),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                SkeletonLine(
                  style: SkeletonLineStyle(
                      height: size.height * 0.3,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                SkeletonLine(
                  style: SkeletonLineStyle(
                      height: size.height * 0.2,
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10.0))),
                ),
              ],
            )),
      ),
    );
  }

  Widget headerLoad(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration:  BoxDecoration(
              border: Border.all(color:Colors.black,width: 1),
              borderRadius:const BorderRadius.all(Radius.circular(20.0)),
              color: Colors.grey,
            ),
            height: 220,
            width: 150,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonLine(
                style: SkeletonLineStyle(
                    height: 25,
                    maxLength: size.width,
                    borderRadius:const  BorderRadius.all(Radius.circular(10.0))),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const SkeletonLine(
                style: SkeletonLineStyle(
                    randomLength: true,
                    height: 14,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              const  SizedBox(
                height: 5.0,
              ),
              const  SkeletonLine(
                style: SkeletonLineStyle(
                    randomLength: true,
                    height: 12,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const  SkeletonLine(
                style: SkeletonLineStyle(
                    randomLength: true,
                    height: 12,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              const  SizedBox(
                height: 5.0,
              ),
              const  SkeletonLine(
                style: SkeletonLineStyle(
                    height: 12,
                    randomLength: true,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              const  SizedBox(
                height: 5.0,
              ),
              const  SkeletonLine(
                style: SkeletonLineStyle(
                    height: 12,
                    randomLength: true,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
