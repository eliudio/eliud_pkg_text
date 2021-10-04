/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_text/model/html_model.dart';

abstract class HtmlListEvent extends Equatable {
  const HtmlListEvent();
  @override
  List<Object?> get props => [];
}

class LoadHtmlList extends HtmlListEvent {}

class NewPage extends HtmlListEvent {}

class AddHtmlList extends HtmlListEvent {
  final HtmlModel? value;

  const AddHtmlList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddHtmlList{ value: $value }';
}

class UpdateHtmlList extends HtmlListEvent {
  final HtmlModel? value;

  const UpdateHtmlList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateHtmlList{ value: $value }';
}

class DeleteHtmlList extends HtmlListEvent {
  final HtmlModel? value;

  const DeleteHtmlList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteHtmlList{ value: $value }';
}

class HtmlListUpdated extends HtmlListEvent {
  final List<HtmlModel?>? value;
  final bool? mightHaveMore;

  const HtmlListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'HtmlListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

