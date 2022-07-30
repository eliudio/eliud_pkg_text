import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_model.dart';
import 'package:eliud_pkg_text/platform/widgets/handle_member_medium_model.dart';
import 'package:eliud_pkg_text/platform/widgets/handle_platform_medium_model.dart';
import 'package:eliud_pkg_text/platform/widgets/html_text_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:eliud_core/core/navigate/router.dart' as router;
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  @override
  Widget htmlWidget(BuildContext context, AppModel app, String html) {
    return HtmlWidget(html, onTapUrl: (url) async {
      var homeURL = app.homeURL;
      if (homeURL != null) {
        homeURL = homeURL.toLowerCase();
        url = url.toLowerCase();
        if (url.startsWith(homeURL)) {
          // this is a link within the app
          if (url == homeURL) {
            router.Router.navigateTo(context, InternalAction(app, internalActionEnum: InternalActionEnum.GoHome),);
          } else {
            var rest = url.substring(homeURL.length + 1);
            var split = rest.split('/');
            if (split.length != 2) {
              print("Splitting $rest didn't give 2 items");
            } else {
              var appId = split[0];
              if (appId != '#' + app.documentID) {
                print("appId is " + appId + " which isn't expected");
              }
              var pageId = split[1];
              router.Router.navigateTo(
                context, GotoPage(app, pageID: pageId),);
            }
          }
        } else {
          var uri = Uri.parse(url);
          if (await canLaunchUrl(uri))
            return await launchUrl(uri);
          else
            // can't launch url, there is some error
            print("Could not launch $url");
        }
        return true; // if handled
      } else {
        return false;
      }
    }, onTapImage: (imageMetadata) {
      var photos = imageMetadata.sources.map((src) => src.url).toList();
      Registry.registry()!.getMediumApi().showPhotosUrls(context, app, photos, 0);
    },);
  }
}
