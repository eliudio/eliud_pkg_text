/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_medium_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_text/model/html_medium_model.dart';

abstract class HtmlMediumListState extends Equatable {
  const HtmlMediumListState();

  @override
  List<Object?> get props => [];
}

class HtmlMediumListLoading extends HtmlMediumListState {}

class HtmlMediumListLoaded extends HtmlMediumListState {
  final List<HtmlMediumModel?>? values;
  final bool? mightHaveMore;

  const HtmlMediumListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'HtmlMediumListLoaded { values: $values }';
}

class HtmlMediumNotLoaded extends HtmlMediumListState {}

