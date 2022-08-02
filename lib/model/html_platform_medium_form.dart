/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_platform_medium_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/state/logged_in.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/style/admin/admin_form_style.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:intl/intl.dart';

import 'package:eliud_core/eliud.dart';

import 'package:eliud_core/model/internal_component.dart';
import 'package:eliud_pkg_text/model/embedded_component.dart';
import 'package:eliud_pkg_text/tools/bespoke_formfields.dart';
import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_text/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_text/model/repository_export.dart';
import 'package:eliud_core/model/embedded_component.dart';
import 'package:eliud_pkg_text/model/embedded_component.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_text/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_text/model/entity_export.dart';

import 'package:eliud_pkg_text/model/html_platform_medium_list_bloc.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_list_event.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_model.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_form_bloc.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_form_event.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_form_state.dart';


class HtmlPlatformMediumForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  HtmlPlatformMediumModel? value;
  ActionModel? submitAction;

  HtmlPlatformMediumForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<HtmlPlatformMediumFormBloc >(
            create: (context) => HtmlPlatformMediumFormBloc(appId,
                                       
                                                )..add(InitialiseHtmlPlatformMediumFormEvent(value: value)),
  
        child: MyHtmlPlatformMediumForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<HtmlPlatformMediumFormBloc >(
            create: (context) => HtmlPlatformMediumFormBloc(appId,
                                       
                                                )..add(InitialiseHtmlPlatformMediumFormNoLoadEvent(value: value)),
  
        child: MyHtmlPlatformMediumForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update HtmlPlatformMedium' : 'Add HtmlPlatformMedium'),
        body: BlocProvider<HtmlPlatformMediumFormBloc >(
            create: (context) => HtmlPlatformMediumFormBloc(appId,
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseHtmlPlatformMediumFormEvent(value: value) : InitialiseNewHtmlPlatformMediumFormEvent())),
  
        child: MyHtmlPlatformMediumForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyHtmlPlatformMediumForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyHtmlPlatformMediumForm({required this.app, this.formAction, this.submitAction});

  _MyHtmlPlatformMediumFormState createState() => _MyHtmlPlatformMediumFormState(this.formAction);
}


class _MyHtmlPlatformMediumFormState extends State<MyHtmlPlatformMediumForm> {
  final FormAction? formAction;
  late HtmlPlatformMediumFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  String? _medium;


  _MyHtmlPlatformMediumFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<HtmlPlatformMediumFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<HtmlPlatformMediumFormBloc, HtmlPlatformMediumFormState>(builder: (context, state) {
      if (state is HtmlPlatformMediumFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is HtmlPlatformMediumFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.medium != null)
          _medium= state.value!.medium!.documentID;
        else
          _medium= "";
      }
      if (state is HtmlPlatformMediumFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Image')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(app: widget.app, id: "platformMediums", value: _medium, trigger: (value, privilegeLevel) => _onMediumSelected(value), optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is HtmlPlatformMediumFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<HtmlPlatformMediumListBloc>(context).add(
                          UpdateHtmlPlatformMediumList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              medium: state.value!.medium, 
                        )));
                      } else {
                        BlocProvider.of<HtmlPlatformMediumListBloc>(context).add(
                          AddHtmlPlatformMediumList(value: HtmlPlatformMediumModel(
                              documentID: state.value!.documentID, 
                              medium: state.value!.medium, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        eliudrouter.Router.navigateTo(context, widget.submitAction!);
                      } else {
                        Navigator.pop(context);
                      }
                    }
                  },
                ));

        return StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().container(widget.app, context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedHtmlPlatformMediumDocumentID(value: _documentIDController.text));
  }


  void _onMediumSelected(String? val) {
    setState(() {
      _medium = val;
    });
    _myFormBloc.add(ChangedHtmlPlatformMediumMedium(value: val));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, HtmlPlatformMediumFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID));
  }
  

}



