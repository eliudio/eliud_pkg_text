import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_pkg_text_model/model/html_with_platform_medium_model.dart';
import 'package:eliud_pkg_text/platform/widgets/html_text_dialog.dart';
import 'package:eliud_pkg_text/platform/widgets/html_with_platform_medium_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:eliud_pkg_text_model/model/html_platform_medium_model.dart';

typedef UpdatedHtml = Function(String value);

abstract class AbstractTextPlatform {
  static AbstractTextPlatform? platform;

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
    UpdatedHtml updatedHtml,
    MediaAction mediaAction,
    String title,
    String initialValue,
    bool isWeb, {
    List<Widget>? extraIcons,
    List<String>? accessibleByMembers,
  }) {
    HtmlTextDialog.open(
        context, app, ownerId, title, updatedHtml, initialValue, isWeb,
        extraIcons: extraIcons, mediaAction: mediaAction);
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
    HtmlTextDialog.open(
        context,
        app,
        ownerId,
        title,
        (value) {
          htmlModel.html = value;
          updatedHtml(value);
        },
        htmlModel.html ?? '',
        isWeb,
        extraIcons: extraIcons,
        mediaAction: (AddMediaHtml addMediaHtml, String html) async {
          var tempModel = HtmlWithPlatformMediumModel(
              documentID: newRandomKey(),
              appId: app.documentID,
              html: html,
              htmlMedia: htmlModel.htmlMedia,
              conditions: htmlModel.conditions);
          // the HtmlWithPlatformMediumComponents uses (unfortunately) a HtmlWithPlatformMediumModel, so we create one, just to be able to function, and to capture htmlMedia
          await HtmlWithPlatformMediumComponents.openIt(app, context, tempModel,
              (accepted, model) {
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
