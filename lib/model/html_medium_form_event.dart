/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_medium_form_event.dart
                       
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
abstract class HtmlMediumFormEvent extends Equatable {
  const HtmlMediumFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewHtmlMediumFormEvent extends HtmlMediumFormEvent {
}


class InitialiseHtmlMediumFormEvent extends HtmlMediumFormEvent {
  final HtmlMediumModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseHtmlMediumFormEvent({this.value});
}

class InitialiseHtmlMediumFormNoLoadEvent extends HtmlMediumFormEvent {
  final HtmlMediumModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseHtmlMediumFormNoLoadEvent({this.value});
}

class ChangedHtmlMediumDocumentID extends HtmlMediumFormEvent {
  final String? value;

  ChangedHtmlMediumDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedHtmlMediumDocumentID{ value: $value }';
}

class ChangedHtmlMediumMedium extends HtmlMediumFormEvent {
  final String? value;

  ChangedHtmlMediumMedium({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedHtmlMediumMedium{ value: $value }';
}

