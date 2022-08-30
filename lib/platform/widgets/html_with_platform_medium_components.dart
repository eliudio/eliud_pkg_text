import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_event.dart';
import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_state.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_model.dart';

import '../../model/html_platform_medium_model.dart';
import 'bloc/html_with_platform_medium_component_bloc.dart';

/*
      controller.insertHtml("<img src='https://via.placeholder.com/150'/>");
      HtmlWithPlatformMediumComponents.openIt(widget.app, context, model);
 */
class HtmlWithPlatformMediumComponents extends StatefulWidget {
  static void openIt(
      AppModel app, BuildContext context, HtmlWithPlatformMediumModel model) {
    openComplexDialog(
      app,
      context,
      app.documentID + '/html_components',
      title: 'Images and Videos',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<HtmlPlatformMediumBloc>(
          create: (context) => HtmlPlatformMediumBloc(
                app.documentID,
              )..add(
                  ExtEditorBaseInitialise<HtmlWithPlatformMediumModel>(model)),
          child: HtmlWithPlatformMediumComponents(
            app: app,
          )),
    );
  }

  final AppModel app;

  const HtmlWithPlatformMediumComponents({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _HtmlWithPlatformMediumComponentsState();
}

class _HtmlWithPlatformMediumComponentsState
    extends State<HtmlWithPlatformMediumComponents> {
  @override
  Widget build(BuildContext context) {
    var ownerId = AccessBloc.member(context)!.documentID;
    return BlocBuilder<HtmlPlatformMediumBloc,
            ExtEditorBaseState<HtmlWithPlatformMediumModel>>(
        builder: (ppContext, htmlWithPMM) {
      if (htmlWithPMM
          is ExtEditorBaseInitialised<HtmlWithPlatformMediumModel, dynamic>) {
        return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
          HeaderWidget(
            title: 'Images and Videos',
            app: widget.app,
            cancelAction: () async {
              return true;
            },
          ),
          topicContainer(widget.app, context,
              title: 'Images',
              collapsible: true,
              collapsed: true,
              children: [
                _images(context, htmlWithPMM.model.htmlMedia) ??
                    text(widget.app, context, 'No images'),
              ]),
        ]);
      } else {
        return progressIndicator(widget.app, context);
      }
    });
  }

  Widget? _images(BuildContext context,
      List<HtmlPlatformMediumModel>? htmlPlatformMediumModels) {
    var widgets = <Widget>[];
    if (htmlPlatformMediumModels != null) {
      for (var i = 0; i < htmlPlatformMediumModels.length; i++) {
        var item = htmlPlatformMediumModels[i];
        var medium = item.medium;
        if (medium != null) {
          widgets.add(GestureDetector(
              onTap: () {
                Registry.registry()!.getMediumApi().showPhotosPlatform(
                    context,
                    widget.app,
                    htmlPlatformMediumModels.map((e) => e.medium!).toList(),
                    i);
              },
              child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Tooltip(
                      message: medium.documentID + " - " + medium.url!,
                      child: Image.network(
                        medium.url!,

                        //            height: height,
                      )))));
        }
      }

      return GridView.extent(
          maxCrossAxisExtent: 200,
          padding: const EdgeInsets.all(0),
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          physics: const ScrollPhysics(),
          // to disable GridView's scrolling
          shrinkWrap: true,
          children: widgets);
    } else {
      return null;
    }
  }
}
