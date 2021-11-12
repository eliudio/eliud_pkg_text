/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_medium_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

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

import 'package:eliud_pkg_text/model/html_medium_list_bloc.dart';
import 'package:eliud_pkg_text/model/html_medium_list_event.dart';
import 'package:eliud_pkg_text/model/html_medium_model.dart';
import 'package:eliud_pkg_text/model/html_medium_form_bloc.dart';
import 'package:eliud_pkg_text/model/html_medium_form_event.dart';
import 'package:eliud_pkg_text/model/html_medium_form_state.dart';


class HtmlMediumForm extends StatelessWidget {
  FormAction formAction;
  HtmlMediumModel? value;
  ActionModel? submitAction;

  HtmlMediumForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.currentApp(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<HtmlMediumFormBloc >(
            create: (context) => HtmlMediumFormBloc(AccessBloc.currentAppId(context),
                                       
                                                )..add(InitialiseHtmlMediumFormEvent(value: value)),
  
        child: MyHtmlMediumForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<HtmlMediumFormBloc >(
            create: (context) => HtmlMediumFormBloc(AccessBloc.currentAppId(context),
                                       
                                                )..add(InitialiseHtmlMediumFormNoLoadEvent(value: value)),
  
        child: MyHtmlMediumForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update HtmlMedium' : 'Add HtmlMedium'),
        body: BlocProvider<HtmlMediumFormBloc >(
            create: (context) => HtmlMediumFormBloc(AccessBloc.currentAppId(context),
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseHtmlMediumFormEvent(value: value) : InitialiseNewHtmlMediumFormEvent())),
  
        child: MyHtmlMediumForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyHtmlMediumForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyHtmlMediumForm({this.formAction, this.submitAction});

  _MyHtmlMediumFormState createState() => _MyHtmlMediumFormState(this.formAction);
}


class _MyHtmlMediumFormState extends State<MyHtmlMediumForm> {
  final FormAction? formAction;
  late HtmlMediumFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  String? _medium;


  _MyHtmlMediumFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<HtmlMediumFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.currentApp(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<HtmlMediumFormBloc, HtmlMediumFormState>(builder: (context, state) {
      if (state is HtmlMediumFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context),
      );

      if (state is HtmlMediumFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.medium != null)
          _medium= state.value!.medium!.documentID;
        else
          _medium= "";
      }
      if (state is HtmlMediumFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Image')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "platformMediums", value: _medium, trigger: _onMediumSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is HtmlMediumFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<HtmlMediumListBloc>(context).add(
                          UpdateHtmlMediumList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              medium: state.value!.medium, 
                        )));
                      } else {
                        BlocProvider.of<HtmlMediumListBloc>(context).add(
                          AddHtmlMediumList(value: HtmlMediumModel(
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

        return StyleRegistry.registry().styleWithContext(context).adminFormStyle().container(context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedHtmlMediumDocumentID(value: _documentIDController.text));
  }


  void _onMediumSelected(String? val) {
    setState(() {
      _medium = val;
    });
    _myFormBloc.add(ChangedHtmlMediumMedium(value: val));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, HtmlMediumFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(AccessBloc.currentAppId(context)));
  }
  

}



