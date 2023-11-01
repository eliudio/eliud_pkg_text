/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_with_platform_medium_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';




import 'package:eliud_pkg_text/model/embedded_component.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_text/model/model_export.dart';

import 'package:eliud_pkg_text/model/html_with_platform_medium_list_bloc.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_list_event.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_model.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_form_bloc.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_form_event.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_form_state.dart';


class HtmlWithPlatformMediumForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  HtmlWithPlatformMediumModel? value;
  ActionModel? submitAction;

  HtmlWithPlatformMediumForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<HtmlWithPlatformMediumFormBloc >(
            create: (context) => HtmlWithPlatformMediumFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseHtmlWithPlatformMediumFormEvent(value: value)),
  
        child: MyHtmlWithPlatformMediumForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<HtmlWithPlatformMediumFormBloc >(
            create: (context) => HtmlWithPlatformMediumFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseHtmlWithPlatformMediumFormNoLoadEvent(value: value)),
  
        child: MyHtmlWithPlatformMediumForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update HtmlWithPlatformMedium' : 'Add HtmlWithPlatformMedium'),
        body: BlocProvider<HtmlWithPlatformMediumFormBloc >(
            create: (context) => HtmlWithPlatformMediumFormBloc(appId,
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseHtmlWithPlatformMediumFormEvent(value: value) : InitialiseNewHtmlWithPlatformMediumFormEvent())),
  
        child: MyHtmlWithPlatformMediumForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyHtmlWithPlatformMediumForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyHtmlWithPlatformMediumForm({required this.app, this.formAction, this.submitAction});

  _MyHtmlWithPlatformMediumFormState createState() => _MyHtmlWithPlatformMediumFormState(this.formAction);
}


class _MyHtmlWithPlatformMediumFormState extends State<MyHtmlWithPlatformMediumForm> {
  final FormAction? formAction;
  late HtmlWithPlatformMediumFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _htmlController = TextEditingController();


  _MyHtmlWithPlatformMediumFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<HtmlWithPlatformMediumFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _htmlController.addListener(_onHtmlChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<HtmlWithPlatformMediumFormBloc, HtmlWithPlatformMediumFormState>(builder: (context, state) {
      if (state is HtmlWithPlatformMediumFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is HtmlWithPlatformMediumFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
        if (state.value!.description != null)
          _descriptionController.text = state.value!.description.toString();
        else
          _descriptionController.text = "";
        if (state.value!.html != null)
          _htmlController.text = state.value!.html.toString();
        else
          _htmlController.text = "";
      }
      if (state is HtmlWithPlatformMediumFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: htmlPlatformMediumsList(widget.app, context, state.value!.htmlMedia, _onHtmlMediaChanged)
                )
          );



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDHtmlWithPlatformMediumFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Description', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _descriptionController, keyboardType: TextInputType.text, validator: (_) => state is DescriptionHtmlWithPlatformMediumFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Html', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _htmlController, keyboardType: TextInputType.text, validator: (_) => state is HtmlHtmlWithPlatformMediumFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Conditions')
                ));



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is HtmlWithPlatformMediumFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<HtmlWithPlatformMediumListBloc>(context).add(
                          UpdateHtmlWithPlatformMediumList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              description: state.value!.description, 
                              html: state.value!.html, 
                              htmlMedia: state.value!.htmlMedia, 
                              background: state.value!.background, 
                              conditions: state.value!.conditions, 
                        )));
                      } else {
                        BlocProvider.of<HtmlWithPlatformMediumListBloc>(context).add(
                          AddHtmlWithPlatformMediumList(value: HtmlWithPlatformMediumModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              description: state.value!.description, 
                              html: state.value!.html, 
                              htmlMedia: state.value!.htmlMedia, 
                              background: state.value!.background, 
                              conditions: state.value!.conditions, 
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
              children: children
            ),
          ), formAction!
        );
      } else {
        return StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedHtmlWithPlatformMediumDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedHtmlWithPlatformMediumAppId(value: _appIdController.text));
  }


  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedHtmlWithPlatformMediumDescription(value: _descriptionController.text));
  }


  void _onHtmlChanged() {
    _myFormBloc.add(ChangedHtmlWithPlatformMediumHtml(value: _htmlController.text));
  }


  void _onHtmlMediaChanged(value) {
    _myFormBloc.add(ChangedHtmlWithPlatformMediumHtmlMedia(value: value));
    setState(() {});
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _descriptionController.dispose();
    _htmlController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, HtmlWithPlatformMediumFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID));
  }
  

}



