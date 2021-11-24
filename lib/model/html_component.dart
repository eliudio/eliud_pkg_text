/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_pkg_text/model/html_component_bloc.dart';
import 'package:eliud_pkg_text/model/html_component_event.dart';
import 'package:eliud_pkg_text/model/html_model.dart';
import 'package:eliud_pkg_text/model/html_repository.dart';
import 'package:eliud_pkg_text/model/html_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

abstract class AbstractHtmlComponent extends StatelessWidget {
  static String componentName = "htmls";
  final String theAppId;
  final String htmlId;

  AbstractHtmlComponent({Key? key, required this.theAppId, required this.htmlId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HtmlComponentBloc> (
          create: (context) => HtmlComponentBloc(
            htmlRepository: htmlRepository(appId: theAppId)!)
        ..add(FetchHtmlComponent(id: htmlId)),
      child: _htmlBlockBuilder(context),
    );
  }

  Widget _htmlBlockBuilder(BuildContext context) {
    return BlocBuilder<HtmlComponentBloc, HtmlComponentState>(builder: (context, state) {
      if (state is HtmlComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(title: "Error", content: 'No Html defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is HtmlComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is HtmlComponentError) {
        return AlertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, HtmlModel value);
}

