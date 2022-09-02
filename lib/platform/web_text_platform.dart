import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_model.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_model.dart';
import 'package:eliud_pkg_text/platform/text_platform.dart';
import 'package:eliud_pkg_text/platform/widgets/handle_member_medium_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;
import 'dart:js' as js;
import 'package:eliud_core/core/navigate/router.dart' as router;
import 'package:url_launcher/url_launcher.dart';

import 'html_solution.dart';

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
  Widget htmlWidget(BuildContext context, AppModel app, String html) {
    return htmlWidgetWithPlatformMedia(context, app, html);
  }

  @override
  Widget htmlWidgetWithPlatformMedia(BuildContext context, AppModel app, String html, {List<HtmlPlatformMediumModel>? htmlPlatformMedia}) {
    return htmlSolution(context, app, html, htmlPlatformMedia: htmlPlatformMedia, webView: true);
  }
}
