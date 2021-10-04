/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_text/model/html_model.dart';

abstract class HtmlComponentState extends Equatable {
  const HtmlComponentState();

  @override
  List<Object?> get props => [];
}

class HtmlComponentUninitialized extends HtmlComponentState {}

class HtmlComponentError extends HtmlComponentState {
  final String? message;
  HtmlComponentError({ this.message });
}

class HtmlComponentPermissionDenied extends HtmlComponentState {
  HtmlComponentPermissionDenied();
}

class HtmlComponentLoaded extends HtmlComponentState {
  final HtmlModel? value;

  const HtmlComponentLoaded({ this.value });

  HtmlComponentLoaded copyWith({ HtmlModel? copyThis }) {
    return HtmlComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'HtmlComponentLoaded { value: $value }';
}

