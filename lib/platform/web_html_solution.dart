import 'package:eliud_core_main/apis/action_api/actions/internal_action.dart';
import 'package:eliud_core_main/apis/action_api/actions/goto_page.dart';
import 'package:eliud_core_main/apis/apis.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_pkg_text_model/model/html_platform_medium_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:eliud_core/core/navigate/router.dart' as router;
import 'package:url_launcher/url_launcher.dart';

/*
 * See: mobileHtmlSolution in mobile_html_solution.dart
 *
 * This has now become obsolete as apparently the latest version of HtmlWidget works fine on web and mobile without the below funny stuff
 *
 * mobileHtmlSolution and webHtmlSolution are almost identical with the exception of
 *    mobileHtmlSolution imports package:flutter_widget_from_html/flutter_widget_from_html.dart which supports flutterweb, and
 *    webHtmlSolution imports flutter_widget_from_html_core/flutter_widget_from_html_core.dart which does not support flutterweb
 *
 * However, core does not support video.
 *
 */
Widget webHtmlSolution(BuildContext context, AppModel app, String html,
    {List<HtmlPlatformMediumModel>? htmlPlatformMedia}) {
  return HtmlWidget(
    html,
    onTapUrl: (url) async {
      var homeURL = app.homeURL;
      if (homeURL != null) {
        homeURL = homeURL.toLowerCase();
        url = url.toLowerCase();
        if (url.startsWith(homeURL)) {
          // this is a link within the app
          if (url == homeURL) {
            router.Router.navigateTo(
              context,
              InternalAction(app,
                  internalActionEnum: InternalActionEnum.goHome),
            );
          } else {
            var rest = url.substring(homeURL.length + 1);
            var split = rest.split('/');
            if (split.length != 2) {
              print("Splitting $rest didn't give 2 items");
            } else {
              var appId = split[0];
              if (appId != '#${app.documentID}') {
                print("appId is $appId which isn't expected");
              }
              var pageId = split[1];
              router.Router.navigateTo(
                context,
                GotoPage(app, pageID: pageId),
              );
            }
          }
        } else {
          var uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            return await launchUrl(uri);
          } else {
            // can't launch url, there is some error
            print("Could not launch $url");
          }
        }
        return true; // if handled
      } else {
        return false;
      }
    },
    onTapImage: (imageMetadata) {
      var photos = imageMetadata.sources.map((src) => src.url).toList();
      var index = -1;
      if ((htmlPlatformMedia != null) && (photos.length == 1)) {
        var photo = photos[0];
        for (int i = 0; i < htmlPlatformMedia.length; i++) {
          var htmlPlatformMedium = htmlPlatformMedia[i];
          var medium = htmlPlatformMedium.medium;
          if (medium != null) {
            if (medium.url == photo) {
              index = i;
              break;
            }
          }
        }
      }
      if (index == -1) {
        Apis.apis().getMediumApi().showPhotosUrls(context, app, photos, 0);
      } else {
        Apis.apis().getMediumApi().showPhotosPlatform(context, app,
            htmlPlatformMedia!.map((e) => e.medium!).toList(), index);
      }
    },
  );
}
