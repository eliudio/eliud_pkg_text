/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_platform_medium_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:bloc/bloc.dart';




import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_text/model/model_export.dart';

import 'package:eliud_pkg_text/model/html_platform_medium_form_event.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_form_state.dart';

class HtmlPlatformMediumFormBloc extends Bloc<HtmlPlatformMediumFormEvent, HtmlPlatformMediumFormState> {
  final String? appId;

  HtmlPlatformMediumFormBloc(this.appId, ): super(HtmlPlatformMediumFormUninitialized()) {
      on <InitialiseNewHtmlPlatformMediumFormEvent> ((event, emit) {
        HtmlPlatformMediumFormLoaded loaded = HtmlPlatformMediumFormLoaded(value: HtmlPlatformMediumModel(
                                               documentID: "IDENTIFIER", 
                                 htmlReference: "",

        ));
        emit(loaded);
      });


      on <InitialiseHtmlPlatformMediumFormEvent> ((event, emit) async {
        HtmlPlatformMediumFormLoaded loaded = HtmlPlatformMediumFormLoaded(value: event.value);
        emit(loaded);
      });
      on <InitialiseHtmlPlatformMediumFormNoLoadEvent> ((event, emit) async {
        HtmlPlatformMediumFormLoaded loaded = HtmlPlatformMediumFormLoaded(value: event.value);
        emit(loaded);
      });
      HtmlPlatformMediumModel? newValue = null;
      on <ChangedHtmlPlatformMediumMedium> ((event, emit) async {
      if (state is HtmlPlatformMediumFormInitialized) {
        final currentState = state as HtmlPlatformMediumFormInitialized;
        if (event.value != null)
          newValue = currentState.value!.copyWith(medium: await platformMediumRepository(appId: appId)!.get(event.value));
        emit(SubmittableHtmlPlatformMediumForm(value: newValue));

      }
      });
  }


}

