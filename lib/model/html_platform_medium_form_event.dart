/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_platform_medium_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_pkg_text/model/model_export.dart';

@immutable
abstract class HtmlPlatformMediumFormEvent extends Equatable {
  const HtmlPlatformMediumFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewHtmlPlatformMediumFormEvent
    extends HtmlPlatformMediumFormEvent {}

class InitialiseHtmlPlatformMediumFormEvent
    extends HtmlPlatformMediumFormEvent {
  final HtmlPlatformMediumModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseHtmlPlatformMediumFormEvent({this.value});
}

class InitialiseHtmlPlatformMediumFormNoLoadEvent
    extends HtmlPlatformMediumFormEvent {
  final HtmlPlatformMediumModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseHtmlPlatformMediumFormNoLoadEvent({this.value});
}

class ChangedHtmlPlatformMediumDocumentID extends HtmlPlatformMediumFormEvent {
  final String? value;

  ChangedHtmlPlatformMediumDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedHtmlPlatformMediumDocumentID{ value: $value }';
}

class ChangedHtmlPlatformMediumHtmlReference
    extends HtmlPlatformMediumFormEvent {
  final String? value;

  ChangedHtmlPlatformMediumHtmlReference({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'ChangedHtmlPlatformMediumHtmlReference{ value: $value }';
}

class ChangedHtmlPlatformMediumMedium extends HtmlPlatformMediumFormEvent {
  final String? value;

  ChangedHtmlPlatformMediumMedium({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedHtmlPlatformMediumMedium{ value: $value }';
}
