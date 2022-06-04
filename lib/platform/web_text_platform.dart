import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
/*
import 'dart:html' as html;
import 'dart:ui' as ui;
import 'dart:js' as js;
*/

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_model.dart';
import 'package:eliud_pkg_text/platform/text_platform.dart';
import 'package:eliud_pkg_text/platform/widgets/handle_member_medium_model.dart';
import 'package:flutter/cupertino.dart';

class WebTextPlatform extends AbstractTextPlatform {
  @override
  void updateHtmlWithMemberMediumCallback(
      BuildContext context,
      AppModel app,
      String ownerId,
      MemberMediumModelCallback memberMediumModelCallback,
      MemberMediumAccessibleByGroup accessibleByGroup,
      UpdatedHtml updatedHtml,
      String title,
      String initialValue, {
        List<Widget>? extraIcons,
        List<String>? accessibleByMembers,
      }) {
    updateHtmlWithMemberMediumCallbackWebYesNo(
      context,
      app,
      ownerId,
      memberMediumModelCallback,
      accessibleByGroup,
      updatedHtml,
      title,
      initialValue,
      false,
      extraIcons: extraIcons,
      accessibleByMembers: accessibleByMembers,
    );
  }

  @override
  void updateHtmlWithPlatformMedium(
      BuildContext context,
      AppModel app,
      String ownerId,
      HtmlWithPlatformMediumModel htmlModel,
      UpdatedHtml updatedHtml,
      String title,
      {List<Widget>? extraIcons}) {
    updateHtmlWithPlatformMediumWebYesNo(
        context, app, ownerId, htmlModel, updatedHtml, title, true,
        extraIcons: extraIcons);
  }

  @override
  Widget htmlWidget(String html) {
    return HtmlWidget(html);
  }
}

/*
class HtmlWidget extends StatefulWidget {
  final String html;

  const HtmlWidget({Key? key, required this.html}) : super(key: key);

  @override
  _HtmlState createState() => _HtmlState();
}

class _HtmlState extends State<HtmlWidget> {
  late html.IFrameElement _element;

  @override
  void initState() {
    _element = html.IFrameElement()
*/
/*
      ..width = "200px"
      ..height = "200px"
*//*

      ..style.border = 'none'
      ..srcdoc = widget.html;

*/
/*
    js.context["purchase_units"] = js.JsObject.jsify([
      {
        'amount': {'value': '0.02'}
      }
    ]);
*//*


    // ignore:undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'htmlPage',
          (int viewId) => _element,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 220,
      child: HtmlElementView(viewType: 'htmlPage'),
    );
  }
}*/
