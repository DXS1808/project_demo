import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/config/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_demo/presentation/view/home_screen/home_cubit/home_cubit.dart';

class SearchMovie extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const SearchMovie(this.controller, this.focusNode, {Key? key})
      : super(key: key);

  @override
  State<SearchMovie> createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: focusNode,
      style: const TextStyle(color: Colors.white),
      autofocus: true,
      onFieldSubmitted: (value) {
        focusNode.unfocus();
      },
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          labelStyle: const TextStyle(
              fontSize: 13,
              fontFamily: Constants.FONTFAMILY,
              color: Colors.white),
          hintStyle: const TextStyle(
              fontFamily: Constants.FONTFAMILY, color: Colors.white),
          contentPadding: const EdgeInsets.all(5.0),
          labelText: AppLocalizations.of(context)!.label_search,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)))),
      onChanged: (value) {
        EasyDebounce.debounce(
            'search-keyword',
            const Duration(milliseconds: 100),
            () => context.read<HomeCubit>().getSearchMovieList(value));
      },
    );
  }
}
