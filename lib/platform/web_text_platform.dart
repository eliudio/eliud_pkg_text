import 'dart:convert';

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_model.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_model.dart';
import 'package:eliud_pkg_text/platform/text_platform.dart';
import 'package:eliud_pkg_text/platform/web_html_solution.dart';
import 'package:eliud_pkg_text/platform/web_html_solution2.dart';
import 'package:eliud_pkg_text/platform/widgets/html_text_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:html_editor_enhanced/utils/utils.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

class WebTextPlatform extends AbstractTextPlatform {
  @override
  void updateHtmlWithMemberMediumCallback(
    BuildContext context,
    AppModel app,
    String ownerId,
    UpdatedHtml updatedHtml,
    MediaAction mediaAction,
    String title,
    String initialValue, {
    List<Widget>? extraIcons,
    List<String>? accessibleByMembers,
  }) {
    updateHtmlWithMemberMediumCallbackWebYesNo(
      context,
      app,
      ownerId,
      updatedHtml,
      mediaAction,
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
  Widget htmlWidgetWithPlatformMedia(
      BuildContext context, AppModel app, String html,
      {List<HtmlPlatformMediumModel>? htmlPlatformMedia}) {
    if (html.toUpperCase().contains("<VIDEO")) {
      return webHtmlSolution2(
          context, html, );
    } else {
      return webHtmlSolution(
          context, app, html, htmlPlatformMedia: htmlPlatformMedia);
    }
  }
}
