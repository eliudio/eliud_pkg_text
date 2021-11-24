import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/model/conditions_simple_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/widgets/condition_simple_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_pkg_text/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_text/model/html_model.dart';
import 'package:eliud_pkg_text/platform/text_platform.dart';
import 'package:flutter/material.dart';

class HtmlComponentEditorConstructor extends ComponentEditorConstructor {
  @override
  void updateComponent(BuildContext context, model, EditorFeedback feedback) {
    _openIt(context, false, model.copyWith(), feedback);
  }

  @override
  void createNewComponent(BuildContext context, EditorFeedback feedback) {
    var appId = AccessBloc.currentApp(context).documentID;
    _openIt(
        context,
        true,
        HtmlModel(
            documentID: 'new identifier',
            appId: appId,
            name: 'New html',
            conditions: ConditionsSimpleModel(
                privilegeLevelRequired:
                    PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple)),
        feedback);
  }

  @override
  void updateComponentWithID(
      BuildContext context, String id, EditorFeedback feedback) async {
    var html = await htmlRepository(appId: AccessBloc.currentAppId(context))!.get(id);
    if (html != null) {
      _openIt(context, false, html, feedback);
    } else {
      openErrorDialog(context, AccessBloc.currentAppId(context) + '/_error', 
          title: 'Error', errorMessage: 'Cannot find html with id $id');
      feedback(false);
    }
  }

  void _openIt(BuildContext context, bool create, HtmlModel model,
      EditorFeedback feedback) {
    openComplexDialog(
      context,
      AccessBloc.currentAppId(context) + '/divider',
      title: create ? 'Create divider' : 'Update divider',
      includeHeading: false,
      widthFraction: .9,
      child:
          HtmlComponentEditor(model: model, create: create, feedback: feedback),
    );
  }
}

class HtmlComponentEditor extends StatefulWidget {
  final HtmlModel model;
  final bool create;
  final EditorFeedback feedback;

  const HtmlComponentEditor(
      {Key? key,
      required this.model,
      required this.create,
      required this.feedback})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _HtmlComponentEditorState();
}

class _HtmlComponentEditorState extends State<HtmlComponentEditor> {
  @override
  Widget build(BuildContext context) {
    var readOnlyConditions =
        widget.model.htmlMedia != null && !widget.model.htmlMedia!.isEmpty;
    return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
      HeaderWidget(
        title: 'Html',
        okAction: () async {
          var appId = AccessBloc.currentAppId(context);
          if (widget.create) {
            var existingModel = await htmlRepository(appId: appId)!
                .get(widget.model.documentID);
            if (existingModel == null) {
              await htmlRepository(appId: appId)!.add(widget.model);
            } else {
              openErrorDialog(context, AccessBloc.currentAppId(context) + '/_error', 
                  title: 'Error',
                  errorMessage: 'Html with this ID already exists');
              widget.feedback(false);
              return false;
            }
          } else {
            await htmlRepository(appId: appId)!.update(widget.model);
          }

          widget.feedback(true);
          return true;
        },
        cancelAction: () async { return true; },
      ),
      topicContainer(context,
          title: 'General',
          collapsible: true,
          collapsed: true,
          children: [
            getListTile(context,
                leading: Icon(Icons.vpn_key),
                title: widget.create
                    ? dialogField(
                        context,
                        initialValue: widget.model.documentID,
                        valueChanged: (value) {
                          widget.model.documentID = value;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Identifier',
                          labelText: 'Identifier',
                        ),
                      )
                    : text(context, widget.model.documentID!)),
            getListTile(context,
                leading: Icon(Icons.description),
                title: dialogField(
                  context,
                  initialValue: widget.model.name,
                  valueChanged: (value) {
                    widget.model.name = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    labelText: 'Name',
                  ),
                )),
          ]),
      topicContainer(context,
          title: 'Access',
          collapsible: true,
          collapsed: true,
          children: [
            if (readOnlyConditions)
              text(context,
                  'Access rights can not be changed because the html component contains images'),
            getListTile(context,
                leading: Icon(Icons.security),
                title: ConditionsSimpleWidget(
                  value: widget.model.conditions!,
                  readOnly: readOnlyConditions,
                )),
          ]),
      topicContainer(context,
          title: 'Html',
          collapsible: true,
          collapsed: true,
          children: [
            _htmlWidget(widget.model),
            GestureDetector(
                child: Icon(Icons.edit),
                onTap: () {
                  var ownerId = AccessBloc.member(context)!.documentID;
                  AbstractTextPlatform.platform!.updateHtmlUsingPlatformMedium(
                    context,
                    widget.model.appId!,
                    ownerId!,
                    widget.model,
                    (value) => setState(() {}),
                    "Document contents",
                  );
                })
          ])
    ]);
  }

  Widget _htmlWidget(HtmlModel? value) {
    if ((value == null) || (value.html == null)) {
      return text(context, 'No contents provided');
    } else {
      return AbstractTextPlatform.platform!.htmlWidget(value.html!);
    }
  }
}
