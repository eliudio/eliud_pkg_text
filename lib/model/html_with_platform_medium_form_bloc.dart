/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_with_platform_medium_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_text/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_text/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_text/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_text/model/entity_export.dart';

import 'package:eliud_pkg_text/model/html_with_platform_medium_form_event.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_form_state.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_repository.dart';

class HtmlWithPlatformMediumFormBloc extends Bloc<HtmlWithPlatformMediumFormEvent, HtmlWithPlatformMediumFormState> {
  final FormAction? formAction;
  final String? appId;

  HtmlWithPlatformMediumFormBloc(this.appId, { this.formAction }): super(HtmlWithPlatformMediumFormUninitialized());
  @override
  Stream<HtmlWithPlatformMediumFormState> mapEventToState(HtmlWithPlatformMediumFormEvent event) async* {
    final currentState = state;
    if (currentState is HtmlWithPlatformMediumFormUninitialized) {
      on <InitialiseNewHtmlWithPlatformMediumFormEvent> ((event, emit) {
        HtmlWithPlatformMediumFormLoaded loaded = HtmlWithPlatformMediumFormLoaded(value: HtmlWithPlatformMediumModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",
                                 html: "",
                                 htmlMedia: [],

        ));
        emit(loaded);
      });


      if (event is InitialiseHtmlWithPlatformMediumFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        HtmlWithPlatformMediumFormLoaded loaded = HtmlWithPlatformMediumFormLoaded(value: await htmlWithPlatformMediumRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      } else if (event is InitialiseHtmlWithPlatformMediumFormNoLoadEvent) {
        HtmlWithPlatformMediumFormLoaded loaded = HtmlWithPlatformMediumFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is HtmlWithPlatformMediumFormInitialized) {
      HtmlWithPlatformMediumModel? newValue = null;
      on <ChangedHtmlWithPlatformMediumDocumentID> ((event, emit) async {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableHtmlWithPlatformMediumForm(value: newValue));
        }

      });
      on <ChangedHtmlWithPlatformMediumDescription> ((event, emit) async {
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableHtmlWithPlatformMediumForm(value: newValue));

      });
      on <ChangedHtmlWithPlatformMediumHtml> ((event, emit) async {
        newValue = currentState.value!.copyWith(html: event.value);
        emit(SubmittableHtmlWithPlatformMediumForm(value: newValue));

      });
      on <ChangedHtmlWithPlatformMediumHtmlMedia> ((event, emit) async {
        newValue = currentState.value!.copyWith(htmlMedia: event.value);
        emit(SubmittableHtmlWithPlatformMediumForm(value: newValue));

      });
      on <ChangedHtmlWithPlatformMediumConditions> ((event, emit) async {
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableHtmlWithPlatformMediumForm(value: newValue));

      });
    }
  }


  DocumentIDHtmlWithPlatformMediumFormError error(String message, HtmlWithPlatformMediumModel newValue) => DocumentIDHtmlWithPlatformMediumFormError(message: message, value: newValue);

  Future<HtmlWithPlatformMediumFormState> _isDocumentIDValid(String? value, HtmlWithPlatformMediumModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<HtmlWithPlatformMediumModel?> findDocument = htmlWithPlatformMediumRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableHtmlWithPlatformMediumForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

