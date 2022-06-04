import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_model.dart';
import 'package:eliud_pkg_text/platform/text_platform.dart';
import 'package:eliud_pkg_text/platform/widgets/handle_member_medium_model.dart';
import 'package:eliud_pkg_text/platform/widgets/handle_platform_medium_model.dart';
import 'package:eliud_pkg_text/platform/widgets/html_text_dialog.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

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
    return Text("Nothing");
  }
}
