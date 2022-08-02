import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/presentation/view/home_screen/home_cubit/home_cubit.dart';

class SearchMovie extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const SearchMovie(this.controller, this.focusNode, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      style: const TextStyle(color: Colors.white),
      autofocus: true,
      decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          labelStyle: TextStyle(
              fontSize: 13,
              fontFamily: Constants.FONTFAMILY,
              color: Colors.white),
          hintStyle:
              TextStyle(fontFamily: Constants.FONTFAMILY, color: Colors.white),
          contentPadding: EdgeInsets.all(5.0),
          labelText: "Enter search a movie...",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)))),
      onChanged: (value) {
        EasyDebounce.debounce(
            'search-keyword',
            const Duration(milliseconds: 500),
            () => context.read<HomeCubit>().getSearchMovieList(value));
      },
    );
  }
}
