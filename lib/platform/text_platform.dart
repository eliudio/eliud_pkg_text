import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_model.dart';
import 'package:eliud_pkg_text/platform/widgets/handle_member_medium_model.dart';
import 'package:eliud_pkg_text/platform/widgets/handle_platform_medium_model.dart';
import 'package:eliud_pkg_text/platform/widgets/html_text_dialog.dart';
import 'package:eliud_pkg_text/platform/widgets/html_with_platform_medium_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/core/navigate/router.dart' as router;
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
//import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_model.dart';

typedef UpdatedHtml(String value);

abstract class AbstractTextPlatform {
  static AbstractTextPlatform? platform;

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
  });

  /*
   * Update HtmlWithPlatformMediumModel
   */
  void updateHtmlWithPlatformMedium(
      BuildContext context,
      AppModel app,
      String ownerId,
      HtmlWithPlatformMediumModel htmlModel,
      UpdatedHtml updatedHtml,
      String title,
      {List<Widget>? extraIcons});

  /* Protected updateHtmlWithMemberMediumCallbackWebYesNo
   * Should not be used by client
   *
   * To be used from implementations of updateHtmlWithPlatformMedium
   */
  void updateHtmlWithMemberMediumCallbackWebYesNo(
    BuildContext context,
    AppModel app,
    String ownerId,
    MemberMediumModelCallback memberMediumModelCallback,
    MemberMediumAccessibleByGroup accessibleByGroup,
    UpdatedHtml updatedHtml,
    String title,
    String initialValue,
    bool isWeb, {
    List<Widget>? extraIcons,
    List<String>? accessibleByMembers,
  }) {
    HtmlTextDialog.open(
        context, app, ownerId, title, updatedHtml, initialValue, isWeb,
        extraIcons: extraIcons, mediaAction: null);
  }

  /* Protected updateHtmlWithPlatformMediumWebYesNo
   * Should not be used by client
   *
   * To be used from implementations of updateHtmlWithPlatformMedium
   */
  void updateHtmlWithPlatformMediumWebYesNo(
      BuildContext context,
      AppModel app,
      String ownerId,
      HtmlWithPlatformMediumModel htmlModel,
      UpdatedHtml updatedHtml,
      String title,
      bool isWeb,
      {List<Widget>? extraIcons}) {
    HtmlTextDialog.open(context, app, ownerId, title, (value) {
      htmlModel.html = value;
      updatedHtml(value);
    }, htmlModel.html ?? '', isWeb,
        extraIcons: extraIcons,
        mediaAction: (AddMediaHtml addMediaHtml, String html) async {
          htmlModel.html = html;
          await HtmlWithPlatformMediumComponents.openIt(
              app, context, htmlModel, (accepted, model) {
            if (accepted) {
              htmlModel.htmlMedia = model.htmlMedia;
            }
          }, addMediaHtml: addMediaHtml);
        });
  }

  Widget htmlWidget(
      BuildContext context,
      AppModel app,
      String html,
      );

  Widget htmlWidgetWithPlatformMedia(
      BuildContext context, AppModel app, String html,
      {List<HtmlPlatformMediumModel>? htmlPlatformMedia});


}
