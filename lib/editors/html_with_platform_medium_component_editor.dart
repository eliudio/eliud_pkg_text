import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core/core/widgets/background_widget.dart';
import 'package:eliud_core/core/widgets/helper_widgets/header_widget.dart';
import 'package:eliud_core_main/model/background_model.dart';

import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/storage_conditions_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_container.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog_field.dart';
import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_core/core/widgets/helper_widgets/condition_simple_widget.dart';
import 'package:eliud_pkg_text_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_text_model/model/html_with_platform_medium_model.dart';
import 'package:eliud_pkg_text/platform/text_platform.dart';
import 'package:flutter/material.dart';
import 'package:eliud_pkg_text_model/model/html_platform_medium_model.dart';
import 'package:eliud_pkg_text_model/model/html_with_platform_medium_entity.dart';
import '../platform/widgets/html_util.dart';

class HtmlWithPlatformMediumComponentEditorConstructor
    extends ComponentEditorConstructor {
  @override
  void updateComponent(
      AppModel app, BuildContext context, model, EditorFeedback feedback) {
    _openIt(app, context, false, model.copyWith(), feedback);
  }

  @override
  void createNewComponent(
      AppModel app, BuildContext context, EditorFeedback feedback) {
    var appId = app.documentID;
    _openIt(
        app,
        context,
        true,
        HtmlWithPlatformMediumModel(
            documentID: newRandomKey(),
            appId: appId,
            description: 'New html',
            conditions: StorageConditionsModel(
                privilegeLevelRequired:
                    PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple)),
        feedback);
  }

  @override
  void updateComponentWithID(AppModel app, BuildContext context, String id,
      EditorFeedback feedback) async {
    var html =
        await htmlWithPlatformMediumRepository(appId: app.documentID)!.get(id);
    if (html != null) {
      _openIt(app, context, false, html, feedback);
    } else {
      openErrorDialog(app, context, '${app.documentID}/_error',
          title: 'Error', errorMessage: 'Cannot find html with id $id');
      feedback(false, null);
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create,
      HtmlWithPlatformMediumModel model, EditorFeedback feedback) {
    openComplexDialog(
      app,
      context,
      '${app.documentID}/html_editor',
      title: create ? 'Create divider' : 'Update divider',
      includeHeading: false,
      widthFraction: .9,
      child: HtmlComponentEditor(
          app: app, model: model, create: create, feedback: feedback),
    );
  }

  @override
  revalidateEntity(AppModel app, entity) async {
    var myEntity = entity as HtmlWithPlatformMediumEntity;
    return reviewLinksForHtmlWithPlatformMediumEntity(app, myEntity);
  }
}

class HtmlComponentEditor extends StatefulWidget {
  final AppModel app;
  final HtmlWithPlatformMediumModel model;
  final bool create;
  final EditorFeedback feedback;

  const HtmlComponentEditor(
      {super.key,
      required this.app,
      required this.model,
      required this.create,
      required this.feedback});

  @override
  State<StatefulWidget> createState() => _HtmlComponentEditorState();
}

class _HtmlComponentEditorState extends State<HtmlComponentEditor> {
  @override
  Widget build(BuildContext context) {
    var ownerId = AccessBloc.member(context)!.documentID;
    var readOnlyConditions =
        widget.model.htmlMedia != null && widget.model.htmlMedia!.isNotEmpty;
    return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
      HeaderWidget(
        title: 'Html',
        app: widget.app,
        okAction: () async {
          var appId = widget.app.documentID;
          if (widget.create) {
            var existingModel =
                await htmlWithPlatformMediumRepository(appId: appId)!
                    .get(widget.model.documentID);
            if (existingModel == null) {
              await htmlWithPlatformMediumRepository(appId: appId)!
                  .add(widget.model);
            } else {
              openErrorDialog(
                  widget.app, context, '${widget.app.documentID}/_error',
                  title: 'Error',
                  errorMessage: 'Html with this ID already exists');
              widget.feedback(false, null);
              return false;
            }
          } else {
            await htmlWithPlatformMediumRepository(appId: appId)!
                .update(widget.model);
          }

          widget.feedback(true, widget.model);
          return true;
        },
        cancelAction: () async {
          return true;
        },
      ),
      topicContainer(widget.app, context,
          title: 'General',
          collapsible: true,
          collapsed: true,
          children: [
            getListTile(context, widget.app,
                leading: Icon(Icons.vpn_key),
                title: text(widget.app, context, widget.model.documentID)),
            getListTile(context, widget.app,
                leading: Icon(Icons.description),
                title: dialogField(
                  widget.app,
                  context,
                  initialValue: widget.model.description,
                  valueChanged: (description) {
                    widget.model.description = description;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    labelText: 'Description',
                  ),
                )),
          ]),
      topicContainer(widget.app, context,
          title: 'Background',
          collapsible: true,
          collapsed: true,
          children: [
            checkboxListTile(widget.app, context, 'Background?',
                widget.model.background != null, (value) {
              setState(() {
                if (value!) {
                  widget.model.background = BackgroundModel();
                } else {
                  widget.model.background = null;
                }
              });
            }),
            if (widget.model.background != null)
              BackgroundWidget(
                  app: widget.app,
                  memberId: ownerId,
                  value: widget.model.background!,
                  label: 'Background'),
          ]),
      topicContainer(widget.app, context,
          title: 'Html',
          collapsible: true,
          collapsed: true,
          children: [
            _editButtons(ownerId),
            _htmlWidget(context, widget.app, widget.model),
            _editButtons(ownerId),
          ]),
      topicContainer(widget.app, context,
          title: 'Html as text',
          collapsible: true,
          collapsed: true,
          children: [
            getListTile(context, widget.app,
                leading: Icon(Icons.description),
                title: dialogField(
                  widget.app,
                  context,
                  maxLines: 20,
                  initialValue: widget.model.html,
                  valueChanged: (html) {
                    setState(() {
                      widget.model.html = html;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Html',
                    labelText: 'Html',
                  ),
                )),
          ]),
/*
      topicContainer(widget.app, context,
          title: 'Media',
          collapsible: true,
          collapsed: true,
          children: [
            HtmlWithPlatformMediumComponents.getWidget(
              widget.app,
              context,
              widget.model,
              (accepted, model) {
                widget.model.htmlMedia = model.htmlMedia;
              },
            ),
          ]),
*/
      topicContainer(widget.app, context,
          title: 'Condition',
          collapsible: true,
          collapsed: true,
          children: [
            if (readOnlyConditions)
              text(widget.app, context,
                  'Access rights can not be changed because the html component contains media (which have inherited these rights)'),
            getListTile(context, widget.app,
                leading: Icon(Icons.security),
                title: ConditionsSimpleWidget(
                    app: widget.app,
                    value: widget.model.conditions!,
                    readOnly: readOnlyConditions)),
          ]),
    ]);
  }

  Widget _editButtons(String ownerId) {
    return Row(children: [
      Spacer(),
      GestureDetector(
          child: Icon(Icons.edit),
          onTap: () {
            AbstractTextPlatform.platform!.updateHtmlWithPlatformMedium(
              context,
              widget.app,
              ownerId,
              widget.model,
              (valueX) {
                setState(() {});
              },
              "Document contents",
            );
          })
    ]);
  }

  Widget _htmlWidget(
      BuildContext context, AppModel app, HtmlWithPlatformMediumModel? value) {
    if ((value == null) || (value.html == null)) {
      return text(widget.app, context, 'No contents provided');
    } else {
      return AbstractTextPlatform.platform!.htmlWidgetWithPlatformMedia(
          context, app, value.html!,
          htmlPlatformMedia: value.htmlMedia);
    }
  }
}

class HtmlPlatformMediumModelWithPosition {
  final HtmlPlatformMediumModel htmlPlatformMediumModel;
  final int position;

  HtmlPlatformMediumModelWithPosition(
      this.htmlPlatformMediumModel, this.position);
}
