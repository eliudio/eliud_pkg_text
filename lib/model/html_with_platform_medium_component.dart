/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_with_platform_medium_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_pkg_text/model/html_with_platform_medium_component_bloc.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_component_event.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_model.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractHtmlWithPlatformMediumComponent extends StatelessWidget {
  static String componentName = "htmlWithPlatformMediums";
  final AppModel app;
  final String htmlWithPlatformMediumId;

  AbstractHtmlWithPlatformMediumComponent({Key? key, required this.app, required this.htmlWithPlatformMediumId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HtmlWithPlatformMediumComponentBloc> (
          create: (context) => HtmlWithPlatformMediumComponentBloc(
            htmlWithPlatformMediumRepository: htmlWithPlatformMediumRepository(appId: app.documentID)!)
        ..add(FetchHtmlWithPlatformMediumComponent(id: htmlWithPlatformMediumId)),
      child: _htmlWithPlatformMediumBlockBuilder(context),
    );
  }

  Widget _htmlWithPlatformMediumBlockBuilder(BuildContext context) {
    return BlocBuilder<HtmlWithPlatformMediumComponentBloc, HtmlWithPlatformMediumComponentState>(builder: (context, state) {
      if (state is HtmlWithPlatformMediumComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is HtmlWithPlatformMediumComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is HtmlWithPlatformMediumComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().progressIndicatorStyle().progressIndicator(app, context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, HtmlWithPlatformMediumModel value);
}

