/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_with_platform_medium_form_event.dart
                       
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
abstract class HtmlWithPlatformMediumFormEvent extends Equatable {
  const HtmlWithPlatformMediumFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewHtmlWithPlatformMediumFormEvent extends HtmlWithPlatformMediumFormEvent {
}


class InitialiseHtmlWithPlatformMediumFormEvent extends HtmlWithPlatformMediumFormEvent {
  final HtmlWithPlatformMediumModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseHtmlWithPlatformMediumFormEvent({this.value});
}

class InitialiseHtmlWithPlatformMediumFormNoLoadEvent extends HtmlWithPlatformMediumFormEvent {
  final HtmlWithPlatformMediumModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseHtmlWithPlatformMediumFormNoLoadEvent({this.value});
}

class ChangedHtmlWithPlatformMediumDocumentID extends HtmlWithPlatformMediumFormEvent {
  final String? value;

  ChangedHtmlWithPlatformMediumDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedHtmlWithPlatformMediumDocumentID{ value: $value }';
}

class ChangedHtmlWithPlatformMediumAppId extends HtmlWithPlatformMediumFormEvent {
  final String? value;

  ChangedHtmlWithPlatformMediumAppId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedHtmlWithPlatformMediumAppId{ value: $value }';
}

class ChangedHtmlWithPlatformMediumName extends HtmlWithPlatformMediumFormEvent {
  final String? value;

  ChangedHtmlWithPlatformMediumName({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedHtmlWithPlatformMediumName{ value: $value }';
}

class ChangedHtmlWithPlatformMediumHtml extends HtmlWithPlatformMediumFormEvent {
  final String? value;

  ChangedHtmlWithPlatformMediumHtml({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedHtmlWithPlatformMediumHtml{ value: $value }';
}

class ChangedHtmlWithPlatformMediumHtmlMedia extends HtmlWithPlatformMediumFormEvent {
  final List<HtmlPlatformMediumModel>? value;

  ChangedHtmlWithPlatformMediumHtmlMedia({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedHtmlWithPlatformMediumHtmlMedia{ value: $value }';
}

class ChangedHtmlWithPlatformMediumConditions extends HtmlWithPlatformMediumFormEvent {
  final StorageConditionsModel? value;

  ChangedHtmlWithPlatformMediumConditions({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedHtmlWithPlatformMediumConditions{ value: $value }';
}

