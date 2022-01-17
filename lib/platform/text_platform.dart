import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_model.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_model.dart';
import 'package:eliud_pkg_text/platform/widgets/handle_member_medium_model.dart';
import 'package:eliud_pkg_text/platform/widgets/handle_platform_medium_model.dart';
import 'package:eliud_pkg_text/platform/widgets/html_text_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:eliud_core/model/app_model.dart';

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
        context,
        app,
        ownerId,
        title,
        updatedHtml,
        initialValue,
        isWeb,
        HandleMemberMediumModel(
            app, ownerId, memberMediumModelCallback, accessibleByGroup,
            accessibleByMembers: accessibleByMembers),
        extraIcons: extraIcons);
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
    },
        htmlModel.html ?? '',
        isWeb,
        HandlePlatformMediumModel(
            htmlModel,
            app,
            ownerId,
            htmlModel.conditions == null ||
                    htmlModel.conditions!.privilegeLevelRequired == null
                ? PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple
                : htmlModel.conditions!.privilegeLevelRequired!),
        extraIcons: extraIcons);
  }

  Widget htmlWidget(String html);
}
