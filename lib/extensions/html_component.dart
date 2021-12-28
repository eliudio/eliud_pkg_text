import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/navigate/router.dart' as EliudRouter;
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_pkg_text/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_text/model/html_component.dart';
import 'package:eliud_pkg_text/model/html_model.dart';
import 'package:eliud_pkg_text/model/html_repository.dart';
import 'package:eliud_pkg_text/platform/text_platform.dart';
import 'package:flutter/material.dart';

class HtmlComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return HtmlComponent(key: key, app: app, htmlId: id);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await htmlRepository(appId: app.documentID!)!.get(id);
}

class HtmlComponent extends AbstractHtmlComponent {
  HtmlComponent({Key? key, required AppModel app, required String htmlId})
      : super(key: key, app: app, htmlId: htmlId);

  @override
  Widget yourWidget(BuildContext context, HtmlModel? value) {
    if ((value == null) || (value.html == null)) {
      return text(app, context, 'No contents provided');
    } else {
      return AbstractTextPlatform.platform!.htmlWidget(value.html!);
    }
  }
}
