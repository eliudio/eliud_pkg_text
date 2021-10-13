/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_text/model/html_model.dart';
import 'package:eliud_pkg_text/model/html_component_event.dart';
import 'package:eliud_pkg_text/model/html_component_state.dart';
import 'package:eliud_pkg_text/model/html_repository.dart';
import 'package:flutter/services.dart';

class HtmlComponentBloc extends Bloc<HtmlComponentEvent, HtmlComponentState> {
  final HtmlRepository? htmlRepository;
  StreamSubscription? _htmlSubscription;

  Stream<HtmlComponentState> _mapLoadHtmlComponentUpdateToState(String documentId) async* {
    _htmlSubscription?.cancel();
    _htmlSubscription = htmlRepository!.listenTo(documentId, (value) {
      if (value != null) add(HtmlComponentUpdated(value: value!));
    });
  }

  HtmlComponentBloc({ this.htmlRepository }): super(HtmlComponentUninitialized());

  @override
  Stream<HtmlComponentState> mapEventToState(HtmlComponentEvent event) async* {
    final currentState = state;
    if (event is FetchHtmlComponent) {
      yield* _mapLoadHtmlComponentUpdateToState(event.id!);
    } else if (event is HtmlComponentUpdated) {
      yield HtmlComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _htmlSubscription?.cancel();
    return super.close();
  }

}

