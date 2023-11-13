/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_with_platform_medium_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_text/model/html_with_platform_medium_component_event.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_component_state.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_repository.dart';

class HtmlWithPlatformMediumComponentBloc extends Bloc<
    HtmlWithPlatformMediumComponentEvent,
    HtmlWithPlatformMediumComponentState> {
  final HtmlWithPlatformMediumRepository? htmlWithPlatformMediumRepository;
  StreamSubscription? _htmlWithPlatformMediumSubscription;

  void _mapLoadHtmlWithPlatformMediumComponentUpdateToState(String documentId) {
    _htmlWithPlatformMediumSubscription?.cancel();
    _htmlWithPlatformMediumSubscription =
        htmlWithPlatformMediumRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(HtmlWithPlatformMediumComponentUpdated(value: value));
      }
    });
  }

  /*
   * Construct HtmlWithPlatformMediumComponentBloc
   */
  HtmlWithPlatformMediumComponentBloc({this.htmlWithPlatformMediumRepository})
      : super(HtmlWithPlatformMediumComponentUninitialized()) {
    on<FetchHtmlWithPlatformMediumComponent>((event, emit) {
      _mapLoadHtmlWithPlatformMediumComponentUpdateToState(event.id!);
    });
    on<HtmlWithPlatformMediumComponentUpdated>((event, emit) {
      emit(HtmlWithPlatformMediumComponentLoaded(value: event.value));
    });
  }

  /*
   * Close the HtmlWithPlatformMediumComponentBloc
   */
  @override
  Future<void> close() {
    _htmlWithPlatformMediumSubscription?.cancel();
    return super.close();
  }
}
