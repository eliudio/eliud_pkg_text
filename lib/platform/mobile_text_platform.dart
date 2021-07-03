import 'package:eliud_pkg_text/platform/text_platform.dart';
import 'package:eliud_pkg_text/platform/widgets/html_text_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileTextPlatform extends AbstractTextPlatform {
  @override
  void updateHtml(BuildContext context, String appId, String ownerId, List<String> readAccess, String title, UpdatedHtml updatedHtml, String initialValue) {
    HtmlTextDialog.open(context, appId, ownerId, readAccess, title, updatedHtml, initialValue);
  }
}
