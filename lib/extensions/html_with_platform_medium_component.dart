import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_core_main/tools/etc/etc.dart';
import 'package:eliud_pkg_text_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_text_model/model/html_with_platform_medium_component.dart';
import 'package:eliud_pkg_text_model/model/html_with_platform_medium_model.dart';
import 'package:eliud_pkg_text/platform/text_platform.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_constructor.dart';
import 'package:flutter/material.dart';

class HtmlWithPlatformMediumComponentConstructorDefault
    implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return HtmlWithPlatformMediumComponent(key: key, app: app, htmlId: id);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await htmlWithPlatformMediumRepository(appId: app.documentID)!.get(id);
}

class HtmlWithPlatformMediumComponent
    extends AbstractHtmlWithPlatformMediumComponent {
  HtmlWithPlatformMediumComponent(
      {super.key, required super.app, required String htmlId})
      : super(htmlWithPlatformMediumId: htmlId);

  @override
  Widget yourWidget(BuildContext context, HtmlWithPlatformMediumModel? value) {
    var accessState = AccessBloc.getState(context);
    if ((value == null) || (value.html == null)) {
      return text(app, context, 'No contents provided');
    } else {
      return Container(
          clipBehavior: BoxDecorationHelper.determineClipBehaviour(
              app, accessState.getMember(), value.background),
          margin: BoxDecorationHelper.determineMargin(
              app, accessState.getMember(), value.background),
          padding: BoxDecorationHelper.determinePadding(
              app, accessState.getMember(), value.background),
          decoration: BoxDecorationHelper.boxDecoration(
              app, accessState.getMember(), value.background),
          child: AbstractTextPlatform.platform!.htmlWidgetWithPlatformMedia(
              context, app, value.html!,
              htmlPlatformMedia: value.htmlMedia));
    }
  }
}
