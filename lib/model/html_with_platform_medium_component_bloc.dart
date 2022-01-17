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

import 'package:eliud_pkg_text/model/html_with_platform_medium_model.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_component_event.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_component_state.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_repository.dart';
import 'package:flutter/services.dart';

class HtmlWithPlatformMediumComponentBloc extends Bloc<HtmlWithPlatformMediumComponentEvent, HtmlWithPlatformMediumComponentState> {
  final HtmlWithPlatformMediumRepository? htmlWithPlatformMediumRepository;
  StreamSubscription? _htmlWithPlatformMediumSubscription;

  Stream<HtmlWithPlatformMediumComponentState> _mapLoadHtmlWithPlatformMediumComponentUpdateToState(String documentId) async* {
    _htmlWithPlatformMediumSubscription?.cancel();
    _htmlWithPlatformMediumSubscription = htmlWithPlatformMediumRepository!.listenTo(documentId, (value) {
      if (value != null) add(HtmlWithPlatformMediumComponentUpdated(value: value));
    });
  }

  HtmlWithPlatformMediumComponentBloc({ this.htmlWithPlatformMediumRepository }): super(HtmlWithPlatformMediumComponentUninitialized());

  @override
  Stream<HtmlWithPlatformMediumComponentState> mapEventToState(HtmlWithPlatformMediumComponentEvent event) async* {
    final currentState = state;
    if (event is FetchHtmlWithPlatformMediumComponent) {
      yield* _mapLoadHtmlWithPlatformMediumComponentUpdateToState(event.id!);
    } else if (event is HtmlWithPlatformMediumComponentUpdated) {
      yield HtmlWithPlatformMediumComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _htmlWithPlatformMediumSubscription?.cancel();
    return super.close();
  }

}

