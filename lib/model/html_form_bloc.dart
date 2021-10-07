/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_form_bloc.dart
                       
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

import 'package:eliud_pkg_text/model/html_form_event.dart';
import 'package:eliud_pkg_text/model/html_form_state.dart';
import 'package:eliud_pkg_text/model/html_repository.dart';

class HtmlFormBloc extends Bloc<HtmlFormEvent, HtmlFormState> {
  final FormAction? formAction;
  final String? appId;

  HtmlFormBloc(this.appId, { this.formAction }): super(HtmlFormUninitialized());
  @override
  Stream<HtmlFormState> mapEventToState(HtmlFormEvent event) async* {
    final currentState = state;
    if (currentState is HtmlFormUninitialized) {
      if (event is InitialiseNewHtmlFormEvent) {
        HtmlFormLoaded loaded = HtmlFormLoaded(value: HtmlModel(
                                               documentID: "",
                                 appId: "",
                                 name: "",
                                 html: "",
                                 htmlMedia: [],

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseHtmlFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        HtmlFormLoaded loaded = HtmlFormLoaded(value: await htmlRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseHtmlFormNoLoadEvent) {
        HtmlFormLoaded loaded = HtmlFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is HtmlFormInitialized) {
      HtmlModel? newValue = null;
      if (event is ChangedHtmlDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableHtmlForm(value: newValue);
        }

        return;
      }
      if (event is ChangedHtmlName) {
        newValue = currentState.value!.copyWith(name: event.value);
        yield SubmittableHtmlForm(value: newValue);

        return;
      }
      if (event is ChangedHtmlHtml) {
        newValue = currentState.value!.copyWith(html: event.value);
        yield SubmittableHtmlForm(value: newValue);

        return;
      }
      if (event is ChangedHtmlHtmlMedia) {
        newValue = currentState.value!.copyWith(htmlMedia: event.value);
        yield SubmittableHtmlForm(value: newValue);

        return;
      }
      if (event is ChangedHtmlConditions) {
        newValue = currentState.value!.copyWith(conditions: event.value);
        yield SubmittableHtmlForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDHtmlFormError error(String message, HtmlModel newValue) => DocumentIDHtmlFormError(message: message, value: newValue);

  Future<HtmlFormState> _isDocumentIDValid(String? value, HtmlModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<HtmlModel?> findDocument = htmlRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableHtmlForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

