/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_with_platform_medium_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_model.dart';

abstract class HtmlWithPlatformMediumComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchHtmlWithPlatformMediumComponent
    extends HtmlWithPlatformMediumComponentEvent {
  final String? id;

  FetchHtmlWithPlatformMediumComponent({this.id});
}

class HtmlWithPlatformMediumComponentUpdated
    extends HtmlWithPlatformMediumComponentEvent {
  final HtmlWithPlatformMediumModel value;

  HtmlWithPlatformMediumComponentUpdated({required this.value});
}
