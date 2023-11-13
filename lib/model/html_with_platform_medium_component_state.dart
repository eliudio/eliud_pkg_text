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

/* 
 * HtmlWithPlatformMediumComponentState is the base class for state for HtmlWithPlatformMediumComponentBloc
 */
abstract class HtmlWithPlatformMediumComponentState extends Equatable {
  const HtmlWithPlatformMediumComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * HtmlWithPlatformMediumComponentUninitialized is the uninitialized state of the HtmlWithPlatformMediumComponentBloc 
 */
class HtmlWithPlatformMediumComponentUninitialized
    extends HtmlWithPlatformMediumComponentState {}

/* 
 * HtmlWithPlatformMediumComponentError is the error state of the HtmlWithPlatformMediumComponentBloc 
 */
class HtmlWithPlatformMediumComponentError
    extends HtmlWithPlatformMediumComponentState {
  final String? message;
  HtmlWithPlatformMediumComponentError({this.message});
}

/* 
 * HtmlWithPlatformMediumComponentPermissionDenied is to indicate permission denied state of the HtmlWithPlatformMediumComponentBloc 
 */
class HtmlWithPlatformMediumComponentPermissionDenied
    extends HtmlWithPlatformMediumComponentState {
  HtmlWithPlatformMediumComponentPermissionDenied();
}

/* 
 * HtmlWithPlatformMediumComponentLoaded is used to set the state of the HtmlWithPlatformMediumComponentBloc to the loaded state
 */
class HtmlWithPlatformMediumComponentLoaded
    extends HtmlWithPlatformMediumComponentState {
  final HtmlWithPlatformMediumModel value;

  /* 
   * construct HtmlWithPlatformMediumComponentLoaded
   */
  const HtmlWithPlatformMediumComponentLoaded({required this.value});

  /* 
   * copy method
   */
  HtmlWithPlatformMediumComponentLoaded copyWith(
      {HtmlWithPlatformMediumModel? copyThis}) {
    return HtmlWithPlatformMediumComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'HtmlWithPlatformMediumComponentLoaded { value: $value }';
}
