import 'package:eliud_pkg_text/platform/text_platform.dart';
import 'package:eliud_pkg_text/platform/web/multiline_text_dialog.dart';
import 'package:flutter/cupertino.dart';

import 'mobile/html_text_dialog.dart';

class WebTextPlatform extends AbstractTextPlatform {
  void updateHtml(BuildContext context, String appId, String ownerId, List<String> readAccess, String title,
      UpdatedHtml updatedHtml, String initialValue) {
    HtmlTextDialog.open(context, appId, ownerId, readAccess, title, updatedHtml, initialValue);
  }
}
