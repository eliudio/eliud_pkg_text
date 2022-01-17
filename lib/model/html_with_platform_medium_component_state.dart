/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_with_platform_medium_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_model.dart';

abstract class HtmlWithPlatformMediumComponentState extends Equatable {
  const HtmlWithPlatformMediumComponentState();

  @override
  List<Object?> get props => [];
}

class HtmlWithPlatformMediumComponentUninitialized extends HtmlWithPlatformMediumComponentState {}

class HtmlWithPlatformMediumComponentError extends HtmlWithPlatformMediumComponentState {
  final String? message;
  HtmlWithPlatformMediumComponentError({ this.message });
}

class HtmlWithPlatformMediumComponentPermissionDenied extends HtmlWithPlatformMediumComponentState {
  HtmlWithPlatformMediumComponentPermissionDenied();
}

class HtmlWithPlatformMediumComponentLoaded extends HtmlWithPlatformMediumComponentState {
  final HtmlWithPlatformMediumModel value;

  const HtmlWithPlatformMediumComponentLoaded({ required this.value });

  HtmlWithPlatformMediumComponentLoaded copyWith({ HtmlWithPlatformMediumModel? copyThis }) {
    return HtmlWithPlatformMediumComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'HtmlWithPlatformMediumComponentLoaded { value: $value }';
}

