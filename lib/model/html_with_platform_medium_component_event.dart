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

/*
 * HtmlWithPlatformMediumComponentEvent is the base class for events to be used with constructing a HtmlWithPlatformMediumComponentBloc 
 */
abstract class HtmlWithPlatformMediumComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchHtmlWithPlatformMediumComponent is the event to instruct the bloc to fetch the component
 */
class FetchHtmlWithPlatformMediumComponent
    extends HtmlWithPlatformMediumComponentEvent {
  final String? id;

  /*
   * Construct the FetchHtmlWithPlatformMediumComponent
   */
  FetchHtmlWithPlatformMediumComponent({this.id});
}

/*
 * HtmlWithPlatformMediumComponentUpdated is the event to inform the bloc that a component has been updated
 */
class HtmlWithPlatformMediumComponentUpdated
    extends HtmlWithPlatformMediumComponentEvent {
  final HtmlWithPlatformMediumModel value;

  /*
   * Construct the HtmlWithPlatformMediumComponentUpdated
   */
  HtmlWithPlatformMediumComponentUpdated({required this.value});
}
