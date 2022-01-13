import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_pkg_text/model/html_model.dart';
import 'package:eliud_pkg_text/platform/text_platform.dart';
import 'package:eliud_pkg_text/platform/widgets/handle_member_medium_model.dart';
import 'package:eliud_pkg_text/platform/widgets/handle_platform_medium_model.dart';
import 'package:eliud_pkg_text/platform/widgets/html_text_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
//import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class WebTextPlatform extends AbstractTextPlatform {
  @override
  void updateHtmlUsingMemberMedium(
    BuildContext context,
    AppModel app,
    String ownerId,
    MemberMediumAccessibleByGroup accessibleByGroup,
    String title,
    UpdatedHtml updatedHtml,
    String initialValue, {
    List<Widget>? extraIcons,
    List<String>? accessibleByMembers,
  }) {
    HtmlTextDialog.open(
        context,
        app,
        ownerId,
        title,
        updatedHtml,
        initialValue,
        true,
        HandleMemberMediumModel(app, ownerId, accessibleByGroup,
            accessibleByMembers: accessibleByMembers),
        extraIcons: extraIcons);
  }

  @override
  void updateHtmlUsingPlatformMedium(
      BuildContext context,
      AppModel app,
      String ownerId,
      HtmlModel htmlModel,
      UpdatedHtml updatedHtml,
      String title,
      {List<Widget>? extraIcons}) {
    updateHtmlUsingPlatformMedium2(
        context, app, ownerId, htmlModel, updatedHtml, title, true,
        extraIcons: extraIcons);
  }

  @override
  Widget htmlWidget(String html) {
    return HtmlWidget(html);
  }
}
