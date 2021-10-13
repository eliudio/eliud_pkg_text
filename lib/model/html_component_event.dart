/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_text/model/html_model.dart';

abstract class HtmlComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchHtmlComponent extends HtmlComponentEvent {
  final String? id;

  FetchHtmlComponent({ this.id });
}

class HtmlComponentUpdated extends HtmlComponentEvent {
  final HtmlModel value;

  HtmlComponentUpdated({ required this.value });
}


