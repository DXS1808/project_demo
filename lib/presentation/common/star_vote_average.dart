
import 'package:flutter/material.dart';

class StarVoteAverage extends StatelessWidget {
  final int length;
  const StarVoteAverage({Key? key,required this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> starList = List<Widget>.generate(length, (index) {
      return const Icon(Icons.star,
      color: Colors.yellow,
      );
    });

    return Row(
      children: starList,
    );
  }
}

