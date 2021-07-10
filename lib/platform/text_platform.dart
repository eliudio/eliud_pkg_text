import 'package:eliud_core/model/member_medium_model.dart';
import 'package:flutter/cupertino.dart';

typedef UpdatedHtml(String value);

abstract class AbstractTextPlatform {
  static AbstractTextPlatform? platform;

  void updateHtml(BuildContext context, String appId, String ownerId, List<String> readAccess, String title,
      UpdatedHtml updatedHtml, String initialValue, {List<Widget>? extraIcons});

  Widget htmlWidget(String html);
}
