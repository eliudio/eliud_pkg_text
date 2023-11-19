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

import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_model/style/style_registry.dart';

import 'package:eliud_core/model/internal_component.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_text/model/model_export.dart';

import 'package:eliud_pkg_text/model/html_platform_medium_list_bloc.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_list_event.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_model.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_form_bloc.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_form_event.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_form_state.dart';

class HtmlPlatformMediumForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final HtmlPlatformMediumModel? value;
  final ActionModel? submitAction;

  HtmlPlatformMediumForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the HtmlPlatformMediumForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<HtmlPlatformMediumFormBloc>(
        create: (context) => HtmlPlatformMediumFormBloc(
          appId,
        )..add(InitialiseHtmlPlatformMediumFormEvent(value: value)),
        child: _MyHtmlPlatformMediumForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<HtmlPlatformMediumFormBloc>(
        create: (context) => HtmlPlatformMediumFormBloc(
          appId,
        )..add(InitialiseHtmlPlatformMediumFormNoLoadEvent(value: value)),
        child: _MyHtmlPlatformMediumForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update HtmlPlatformMedium'
                      : 'Add HtmlPlatformMedium'),
          body: BlocProvider<HtmlPlatformMediumFormBloc>(
            create: (context) => HtmlPlatformMediumFormBloc(
              appId,
            )..add((formAction == FormAction.updateAction
                ? InitialiseHtmlPlatformMediumFormEvent(value: value)
                : InitialiseNewHtmlPlatformMediumFormEvent())),
            child: _MyHtmlPlatformMediumForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyHtmlPlatformMediumForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyHtmlPlatformMediumForm(
      {required this.app, this.formAction, this.submitAction});

  @override
  State<_MyHtmlPlatformMediumForm> createState() =>
      _MyHtmlPlatformMediumFormState(formAction);
}

class _MyHtmlPlatformMediumFormState extends State<_MyHtmlPlatformMediumForm> {
  final FormAction? formAction;
  late HtmlPlatformMediumFormBloc _myFormBloc;

  String? _medium;

  _MyHtmlPlatformMediumFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<HtmlPlatformMediumFormBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<HtmlPlatformMediumFormBloc, HtmlPlatformMediumFormState>(
        builder: (context, state) {
      if (state is HtmlPlatformMediumFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is HtmlPlatformMediumFormLoaded) {
        if (state.value!.medium != null) {
          _medium = state.value!.medium!.documentID;
        } else {
          _medium = "";
        }
      }
      if (state is HtmlPlatformMediumFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Image')));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "platformMediums",
              value: _medium,
              trigger: (value, privilegeLevel) => _onMediumSelected(value),
              optional: true),
        );

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if ((formAction != FormAction.showData) &&
            (formAction != FormAction.showPreloadedData)) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .button(
                widget.app,
                context,
                label: 'Submit',
                onPressed: _readOnly(accessState, state)
                    ? null
                    : () {
                        if (state is HtmlPlatformMediumFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<HtmlPlatformMediumListBloc>(context)
                                .add(UpdateHtmlPlatformMediumList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              htmlReference: state.value!.htmlReference,
                              medium: state.value!.medium,
                            )));
                          } else {
                            BlocProvider.of<HtmlPlatformMediumListBloc>(context)
                                .add(AddHtmlPlatformMediumList(
                                    value: HtmlPlatformMediumModel(
                              documentID: state.value!.documentID,
                              htmlReference: state.value!.htmlReference,
                              medium: state.value!.medium,
                            )));
                          }
                          if (widget.submitAction != null) {
                            eliudrouter.Router.navigateTo(
                                context, widget.submitAction!);
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
              ));
        }

        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .container(
                widget.app,
                context,
                Form(
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      physics: ((formAction == FormAction.showData) ||
                              (formAction == FormAction.showPreloadedData))
                          ? NeverScrollableScrollPhysics()
                          : null,
                      shrinkWrap: ((formAction == FormAction.showData) ||
                          (formAction == FormAction.showPreloadedData)),
                      children: children),
                ),
                formAction!);
      } else {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      }
    });
  }

  void _onMediumSelected(String? val) {
    setState(() {
      _medium = val;
    });
    _myFormBloc.add(ChangedHtmlPlatformMediumMedium(value: val));
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(
      AccessState accessState, HtmlPlatformMediumFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
