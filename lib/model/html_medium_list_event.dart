/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_medium_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_text/model/html_medium_model.dart';

abstract class HtmlMediumListEvent extends Equatable {
  const HtmlMediumListEvent();
  @override
  List<Object?> get props => [];
}

class LoadHtmlMediumList extends HtmlMediumListEvent {}

class NewPage extends HtmlMediumListEvent {}

class AddHtmlMediumList extends HtmlMediumListEvent {
  final HtmlMediumModel? value;

  const AddHtmlMediumList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddHtmlMediumList{ value: $value }';
}

class UpdateHtmlMediumList extends HtmlMediumListEvent {
  final HtmlMediumModel? value;

  const UpdateHtmlMediumList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateHtmlMediumList{ value: $value }';
}

class DeleteHtmlMediumList extends HtmlMediumListEvent {
  final HtmlMediumModel? value;

  const DeleteHtmlMediumList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteHtmlMediumList{ value: $value }';
}

class HtmlMediumListUpdated extends HtmlMediumListEvent {
  final List<HtmlMediumModel?>? value;
  final bool? mightHaveMore;

  const HtmlMediumListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'HtmlMediumListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

