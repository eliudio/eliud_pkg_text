// TODO Implement this library.
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/conditions_simple_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
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
  void updateComponent(BuildContext context, model) {
    _openIt(context, false, model.copyWith());
  }

  @override
  void createNewComponent(BuildContext context) {
    var appId = AccessBloc.app(context)!.documentID;
    _openIt(context, true,
        HtmlModel(documentID: 'new identifier', appId: appId, name: 'New html', conditions: ConditionsSimpleModel(privilegeLevelRequired: PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple)));
  }

  @override
  void updateComponentWithID(BuildContext context, String id) async {
    var html = await htmlRepository(appId: AccessBloc.appId(context))!.get(id);
    if (html != null) {
      _openIt(context, false, html);
    } else {
      openErrorDialog(context,
          title: 'Error', errorMessage: 'Cannot find html with id $id');
    }
  }

  void _openIt(BuildContext context, bool create, HtmlModel model) {
    openComplexDialog(
      context,
      title: create ? 'Create divider' : 'Update divider',
      includeHeading: false,
      widthFraction: .9,
      child: HtmlComponentEditor(model: model, create: create),
    );
  }
}

class HtmlComponentEditor extends StatefulWidget {
  final HtmlModel model;
  final bool create;

  const HtmlComponentEditor(
      {Key? key, required this.model, required this.create})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _HtmlComponentEditorState();
}

class _HtmlComponentEditorState extends State<HtmlComponentEditor> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
      HeaderWidget(
        title: 'Html',
        okAction: () async {
          var appId = AccessBloc.appId(context);
          if (widget.create) {
            var existingModel = await htmlRepository(appId: appId)!
                .get(widget.model.documentID);
            if (existingModel == null) {
              htmlRepository(appId: appId)!.add(widget.model);
            } else {
              openErrorDialog(context,
                  title: 'Error',
                  errorMessage: 'Html with this ID already exists');
              return false;
            }
          } else {
            htmlRepository(appId: appId)!.update(widget.model);
          }
          return true;
        },
        cancelAction: () {},
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
            getListTile(context,
                leading: Icon(Icons.security),
                title: ConditionsSimpleWidget(
                  value: widget.model.conditions!,
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
                    AbstractTextPlatform.platform!.updateHtmlUsingPlatformMedium(context,
                        widget.model.appId!,
                        ownerId!,
                        widget.model.conditions!.privilegeLevelRequired!, // to be the same as the component
                        "Document contents",
                            (value) => setState(() => widget.model.html = value),
                        widget.model.html == null ? '' : widget.model.html!);
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
