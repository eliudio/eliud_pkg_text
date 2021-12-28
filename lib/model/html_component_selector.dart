/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'html_list_bloc.dart';
import 'html_list_event.dart';
import 'html_list_state.dart';
import 'html_model.dart';

class HtmlComponentSelector extends ComponentSelector {
  @override
  Widget createSelectWidget(BuildContext context, AppModel app, double height,
      SelectComponent selected, editorConstructor) {
    var appId = app.documentID!;
    return BlocProvider<HtmlListBloc>(
          create: (context) => HtmlListBloc(
            htmlRepository:
                htmlRepository(appId: appId)!,
          )..add(LoadHtmlList()),
      child: SelectHtmlWidget(app: app,
          height: height,
          selected: selected,
          editorConstructor: editorConstructor),
    );
  }
}

class SelectHtmlWidget extends StatefulWidget {
  final AppModel app;
  final double height;
  final SelectComponent selected;
  final ComponentEditorConstructor editorConstructor;

  const SelectHtmlWidget(
      {Key? key,
      required this.app,
      required this.height,
      required this.selected,
      required this.editorConstructor})
      : super(key: key);

  @override
  _SelectHtmlWidgetState createState() {
    return _SelectHtmlWidgetState();
  }
}

class _SelectHtmlWidgetState extends State<SelectHtmlWidget> {
  Widget theList(BuildContext context, List<HtmlModel?> values) {
    var app = widget.app; 
    return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: values.length,
        itemBuilder: (context, index) {
          final value = values[index];
          if (value != null) {
            return getListTile(
              context,
              widget.app,
              trailing: PopupMenuButton<int>(
                  child: Icon(Icons.more_vert),
                  elevation: 10,
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          child: text(widget.app, context, 'Add to page'),
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: text(widget.app, context, 'Update'),
                        ),
                      ],
                  onSelected: (selectedValue) {
                    if (selectedValue == 1) {
                      widget.selected(value.documentID!);
                    } else if (selectedValue == 2) {
                      widget.editorConstructor.updateComponent(widget.app, context, value, (_) {});
                    }
                  }),
              title: value.documentID != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID!)) : Container(),
              subtitle: value.name != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.name!)) : Container(),
            );
          } else {
            return Container();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HtmlListBloc, HtmlListState>(
        builder: (context, state) {
      if (state is HtmlListLoading) {
        return progressIndicator(widget.app, context);
      } else if (state is HtmlListLoaded) {
        if (state.values == null) {
          return text(widget.app, context, 'No items');
        } else {
          var children = <Widget>[];
          children.add(Container(
              height: widget.height - 45,
              child: theList(
                context,
                state.values!,
              )));
          children.add(Column(children: [
            divider(widget.app, context),
            Center(
                child: iconButton(widget.app, 
              context,
              onPressed: () {
                widget.editorConstructor.createNewComponent(widget.app, context, (_) {});
              },
              icon: Icon(Icons.add),
            ))
          ]));
          return ListView(
              physics: ScrollPhysics(), shrinkWrap: true, children: children);
        }
      }
      return Text("nothing");
    });
  }
}



