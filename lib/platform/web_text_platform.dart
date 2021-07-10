import 'package:eliud_pkg_text/platform/text_platform.dart';
import 'package:eliud_pkg_text/platform/widgets/html_text_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class WebTextPlatform extends AbstractTextPlatform {
  void updateHtml(BuildContext context, String appId, String ownerId, List<String> readAccess, String title,
      UpdatedHtml updatedHtml, String initialValue, {List<Widget>? extraIcons}) {
    HtmlTextDialog.open(context, appId, ownerId, readAccess, title, updatedHtml, initialValue, true, extraIcons: extraIcons);
  }

  @override
  Widget htmlWidget(String html) {
    return HtmlWidget(html);
  }
}
