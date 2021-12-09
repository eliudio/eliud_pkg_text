import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_pkg_text/model/html_model.dart';
import 'package:eliud_pkg_text/platform/widgets/handle_platform_medium_model.dart';
import 'package:eliud_pkg_text/platform/widgets/html_text_dialog.dart';
import 'package:flutter/cupertino.dart';

typedef UpdatedHtml(String value);

abstract class AbstractTextPlatform {
  static AbstractTextPlatform? platform;

  void updateHtmlUsingMemberMedium(
      BuildContext context,
      String appId,
      String ownerId,
      List<String> readAccess,
      String title,
      UpdatedHtml updatedHtml,
      String initialValue,
      {List<Widget>? extraIcons});

  @override
  void updateHtmlUsingPlatformMedium(
      BuildContext context,
      String appId,
      String ownerId,
      HtmlModel htmlModel,
      UpdatedHtml updatedHtml,
      String title,
      {List<Widget>? extraIcons});

  void updateHtmlUsingPlatformMedium2(
      BuildContext context,
      String appId,
      String ownerId,
      HtmlModel htmlModel,
      UpdatedHtml updatedHtml,
      String title,
      bool isWeb,
      {List<Widget>? extraIcons}) {
    HtmlTextDialog.open(context, appId, ownerId, title, (value) {
      htmlModel.html = value;
      updatedHtml(value);
    },
        htmlModel.html ?? '',
        isWeb,
        HandlePlatformMediumModel(
            htmlModel,
            appId,
            ownerId,
            htmlModel.conditions == null ||
                    htmlModel.conditions!.privilegeLevelRequired == null
                ? PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple
                : htmlModel.conditions!.privilegeLevelRequired!),
        extraIcons: extraIcons);
  }

  Widget htmlWidget(String html);
}
