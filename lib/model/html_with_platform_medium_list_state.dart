/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_with_platform_medium_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_model.dart';

abstract class HtmlWithPlatformMediumListState extends Equatable {
  const HtmlWithPlatformMediumListState();

  @override
  List<Object?> get props => [];
}

class HtmlWithPlatformMediumListLoading extends HtmlWithPlatformMediumListState {}

class HtmlWithPlatformMediumListLoaded extends HtmlWithPlatformMediumListState {
  final List<HtmlWithPlatformMediumModel?>? values;
  final bool? mightHaveMore;

  const HtmlWithPlatformMediumListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'HtmlWithPlatformMediumListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is HtmlWithPlatformMediumListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class HtmlWithPlatformMediumNotLoaded extends HtmlWithPlatformMediumListState {}

