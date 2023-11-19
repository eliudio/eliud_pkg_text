/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_platform_medium_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_model/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_model.dart';

abstract class HtmlPlatformMediumListEvent extends Equatable {
  const HtmlPlatformMediumListEvent();
  @override
  List<Object?> get props => [];
}

class LoadHtmlPlatformMediumList extends HtmlPlatformMediumListEvent {}

class NewPage extends HtmlPlatformMediumListEvent {}

class AddHtmlPlatformMediumList extends HtmlPlatformMediumListEvent {
  final HtmlPlatformMediumModel? value;

  const AddHtmlPlatformMediumList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddHtmlPlatformMediumList{ value: $value }';
}

class UpdateHtmlPlatformMediumList extends HtmlPlatformMediumListEvent {
  final HtmlPlatformMediumModel? value;

  const UpdateHtmlPlatformMediumList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateHtmlPlatformMediumList{ value: $value }';
}

class DeleteHtmlPlatformMediumList extends HtmlPlatformMediumListEvent {
  final HtmlPlatformMediumModel? value;

  const DeleteHtmlPlatformMediumList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteHtmlPlatformMediumList{ value: $value }';
}

class HtmlPlatformMediumListUpdated extends HtmlPlatformMediumListEvent {
  final List<HtmlPlatformMediumModel?>? value;
  final bool? mightHaveMore;

  const HtmlPlatformMediumListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'HtmlPlatformMediumListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class HtmlPlatformMediumChangeQuery extends HtmlPlatformMediumListEvent {
  final EliudQuery? newQuery;

  const HtmlPlatformMediumChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'HtmlPlatformMediumChangeQuery{ value: $newQuery }';
}
