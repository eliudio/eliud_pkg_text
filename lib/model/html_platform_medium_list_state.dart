/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_platform_medium_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_model.dart';

abstract class HtmlPlatformMediumListState extends Equatable {
  const HtmlPlatformMediumListState();

  @override
  List<Object?> get props => [];
}

class HtmlPlatformMediumListLoading extends HtmlPlatformMediumListState {}

class HtmlPlatformMediumListLoaded extends HtmlPlatformMediumListState {
  final List<HtmlPlatformMediumModel?>? values;
  final bool? mightHaveMore;

  const HtmlPlatformMediumListLoaded(
      {this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'HtmlPlatformMediumListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is HtmlPlatformMediumListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class HtmlPlatformMediumNotLoaded extends HtmlPlatformMediumListState {}
