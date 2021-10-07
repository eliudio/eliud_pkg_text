/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_text/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_text/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_text/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_text/model/entity_export.dart';


@immutable
abstract class HtmlFormEvent extends Equatable {
  const HtmlFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewHtmlFormEvent extends HtmlFormEvent {
}


class InitialiseHtmlFormEvent extends HtmlFormEvent {
  final HtmlModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseHtmlFormEvent({this.value});
}

class InitialiseHtmlFormNoLoadEvent extends HtmlFormEvent {
  final HtmlModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseHtmlFormNoLoadEvent({this.value});
}

class ChangedHtmlDocumentID extends HtmlFormEvent {
  final String? value;

  ChangedHtmlDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedHtmlDocumentID{ value: $value }';
}

class ChangedHtmlAppId extends HtmlFormEvent {
  final String? value;

  ChangedHtmlAppId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedHtmlAppId{ value: $value }';
}

class ChangedHtmlName extends HtmlFormEvent {
  final String? value;

  ChangedHtmlName({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedHtmlName{ value: $value }';
}

class ChangedHtmlHtml extends HtmlFormEvent {
  final String? value;

  ChangedHtmlHtml({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedHtmlHtml{ value: $value }';
}

class ChangedHtmlHtmlMedia extends HtmlFormEvent {
  final List<HtmlMediumModel>? value;

  ChangedHtmlHtmlMedia({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedHtmlHtmlMedia{ value: $value }';
}

class ChangedHtmlConditions extends HtmlFormEvent {
  final ConditionsSimpleModel? value;

  ChangedHtmlConditions({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedHtmlConditions{ value: $value }';
}

