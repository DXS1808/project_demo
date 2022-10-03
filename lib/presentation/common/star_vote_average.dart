import 'package:flutter/material.dart';

class StarVoteAverage extends StatelessWidget {
  final int length;
  const StarVoteAverage({Key? key, required this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> starListYellow = List<Widget>.generate(length, (index) {
      return const Icon(
        Icons.star,
        color: Colors.yellow,
      );
    });
    List<Widget> starListGrey = List<Widget>.generate(5 - length, (index) {
      return const Icon(
        Icons.star_border_outlined,
        color: Colors.yellow,
      );
    });

    return Row(
      children: [
        Row(children: starListYellow),
        Row(
          children: starListGrey,
        )
      ],
    );
  }
}
