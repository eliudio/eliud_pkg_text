/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_text/model/html_model.dart';

abstract class HtmlListState extends Equatable {
  const HtmlListState();

  @override
  List<Object?> get props => [];
}

class HtmlListLoading extends HtmlListState {}

class HtmlListLoaded extends HtmlListState {
  final List<HtmlModel?>? values;
  final bool? mightHaveMore;

  const HtmlListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'HtmlListLoaded { values: $values }';
}

class HtmlNotLoaded extends HtmlListState {}

