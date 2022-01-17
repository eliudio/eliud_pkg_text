/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_with_platform_medium_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_model.dart';

abstract class HtmlWithPlatformMediumListEvent extends Equatable {
  const HtmlWithPlatformMediumListEvent();
  @override
  List<Object?> get props => [];
}

class LoadHtmlWithPlatformMediumList extends HtmlWithPlatformMediumListEvent {}

class NewPage extends HtmlWithPlatformMediumListEvent {}

class AddHtmlWithPlatformMediumList extends HtmlWithPlatformMediumListEvent {
  final HtmlWithPlatformMediumModel? value;

  const AddHtmlWithPlatformMediumList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddHtmlWithPlatformMediumList{ value: $value }';
}

class UpdateHtmlWithPlatformMediumList extends HtmlWithPlatformMediumListEvent {
  final HtmlWithPlatformMediumModel? value;

  const UpdateHtmlWithPlatformMediumList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateHtmlWithPlatformMediumList{ value: $value }';
}

class DeleteHtmlWithPlatformMediumList extends HtmlWithPlatformMediumListEvent {
  final HtmlWithPlatformMediumModel? value;

  const DeleteHtmlWithPlatformMediumList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteHtmlWithPlatformMediumList{ value: $value }';
}

class HtmlWithPlatformMediumListUpdated extends HtmlWithPlatformMediumListEvent {
  final List<HtmlWithPlatformMediumModel?>? value;
  final bool? mightHaveMore;

  const HtmlWithPlatformMediumListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'HtmlWithPlatformMediumListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

