/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_medium_form_bloc.dart
                       
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

import 'package:eliud_pkg_text/model/html_medium_form_event.dart';
import 'package:eliud_pkg_text/model/html_medium_form_state.dart';
import 'package:eliud_pkg_text/model/html_medium_repository.dart';

class HtmlMediumFormBloc extends Bloc<HtmlMediumFormEvent, HtmlMediumFormState> {
  final String? appId;

  HtmlMediumFormBloc(this.appId, ): super(HtmlMediumFormUninitialized());
  @override
  Stream<HtmlMediumFormState> mapEventToState(HtmlMediumFormEvent event) async* {
    final currentState = state;
    if (currentState is HtmlMediumFormUninitialized) {
      if (event is InitialiseNewHtmlMediumFormEvent) {
        HtmlMediumFormLoaded loaded = HtmlMediumFormLoaded(value: HtmlMediumModel(
                                               documentID: "IDENTIFIER", 

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseHtmlMediumFormEvent) {
        HtmlMediumFormLoaded loaded = HtmlMediumFormLoaded(value: event.value);
        yield loaded;
        return;
      } else if (event is InitialiseHtmlMediumFormNoLoadEvent) {
        HtmlMediumFormLoaded loaded = HtmlMediumFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is HtmlMediumFormInitialized) {
      HtmlMediumModel? newValue = null;
      if (event is ChangedHtmlMediumMedium) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(medium: await platformMediumRepository(appId: appId)!.get(event.value));
        else
          newValue = new HtmlMediumModel(
                                 documentID: currentState.value!.documentID,
                                 medium: null,
          );
        yield SubmittableHtmlMediumForm(value: newValue);

        return;
      }
    }
  }


}

