import 'package:eliud_core/model/conditions_simple_model.dart';
import 'package:eliud_pkg_text/platform/text_platform.dart';
import 'package:eliud_pkg_text/platform/widgets/handle_member_medium_model.dart';
import 'package:eliud_pkg_text/platform/widgets/handle_platform_medium_model.dart';
import 'package:eliud_pkg_text/platform/widgets/html_text_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class MobileTextPlatform extends AbstractTextPlatform {
  @override
  void updateHtmlUsingMemberMedium(BuildContext context, String appId, String ownerId, List<String> readAccess, String title, UpdatedHtml updatedHtml, String initialValue, {List<Widget>? extraIcons}) {
    HtmlTextDialog.open(context, appId, ownerId, title, updatedHtml, initialValue, false, HandleMemberMediumModel(appId, ownerId, readAccess), extraIcons: extraIcons);
  }

  @override
  void updateHtmlUsingPlatformMedium(BuildContext context, String appId, String ownerId, PrivilegeLevelRequiredSimple privilegeLevelRequiredSimple, String title, UpdatedHtml updatedHtml, String initialValue, {List<Widget>? extraIcons}) {
    HtmlTextDialog.open(context, appId, ownerId, title, updatedHtml, initialValue, false, HandlePlatformMediumModel(appId, ownerId, privilegeLevelRequiredSimple), extraIcons: extraIcons);
  }

  @override
  Widget htmlWidget(String html) {
    return Html(data: html);
  }
}
