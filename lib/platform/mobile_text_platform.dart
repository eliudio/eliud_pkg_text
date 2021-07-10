import 'package:eliud_pkg_text/platform/text_platform.dart';
import 'package:eliud_pkg_text/platform/widgets/html_text_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class MobileTextPlatform extends AbstractTextPlatform {
  @override
  void updateHtml(BuildContext context, String appId, String ownerId, List<String> readAccess, String title, UpdatedHtml updatedHtml, String initialValue, {List<Widget>? extraIcons}) {
    HtmlTextDialog.open(context, appId, ownerId, readAccess, title, updatedHtml, initialValue, false, extraIcons: extraIcons);
  }

  @override
  Widget htmlWidget(String html) {
    return Html(data: html);
  }
}
