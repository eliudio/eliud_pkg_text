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

  HtmlComponentBloc({ this.htmlRepository }): super(HtmlComponentUninitialized());
  @override
  Stream<HtmlComponentState> mapEventToState(HtmlComponentEvent event) async* {
    final currentState = state;
    if (event is FetchHtmlComponent) {
      try {
        if (currentState is HtmlComponentUninitialized) {
          bool permissionDenied = false;
          final model = await htmlRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield HtmlComponentPermissionDenied();
          } else {
            if (model != null) {
              yield HtmlComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield HtmlComponentError(
                  message: "Html with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield HtmlComponentError(message: "Unknown error whilst retrieving Html");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

