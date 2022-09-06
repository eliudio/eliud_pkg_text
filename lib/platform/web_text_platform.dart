import 'dart:convert';

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_model.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_model.dart';
import 'package:eliud_pkg_text/platform/text_platform.dart';
import 'package:eliud_pkg_text/platform/widgets/html_text_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:html_editor_enhanced/utils/utils.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

class WebTextPlatform extends AbstractTextPlatform {
  @override
  void updateHtmlWithMemberMediumCallback(
    BuildContext context,
    AppModel app,
    String ownerId,
    UpdatedHtml updatedHtml,
    MediaAction mediaAction,
    String title,
    String initialValue, {
    List<Widget>? extraIcons,
    List<String>? accessibleByMembers,
  }) {
    updateHtmlWithMemberMediumCallbackWebYesNo(
      context,
      app,
      ownerId,
      updatedHtml,
      mediaAction,
      title,
      initialValue,
      false,
      extraIcons: extraIcons,
      accessibleByMembers: accessibleByMembers,
    );
  }

  @override
  void updateHtmlWithPlatformMedium(
      BuildContext context,
      AppModel app,
      String ownerId,
      HtmlWithPlatformMediumModel htmlModel,
      UpdatedHtml updatedHtml,
      String title,
      {List<Widget>? extraIcons}) {
    updateHtmlWithPlatformMediumWebYesNo(
        context, app, ownerId, htmlModel, updatedHtml, title, true,
        extraIcons: extraIcons);
  }

  @override
  Widget htmlWidget(BuildContext context, AppModel app, String html) {
    return htmlWidgetWithPlatformMedia(context, app, html);
  }

  @override
  Widget htmlWidgetWithPlatformMedia(
      BuildContext context, AppModel app, String html,
      {List<HtmlPlatformMediumModel>? htmlPlatformMedia}) {
//    return htmlSolution(context, app, html, htmlPlatformMedia: htmlPlatformMedia, webView: true);
    return MyHtmlWidget(html: html);
  }
}

class MyHtmlWidget extends StatefulWidget {
  final String html;

  const MyHtmlWidget({Key? key, required this.html}) : super(key: key);

  @override
  _MyHtmlState createState() => _MyHtmlState();
}

class _MyHtmlState extends State<MyHtmlWidget> {
  late String viewId;
  late double actualHeight;
  Future<bool>? initialised;

  @override
  void initState() {
    actualHeight = 400;
    viewId = getRandString(10);

    super.initState();

    final iframe = html.IFrameElement()
      ..width = fullScreenWidth(context).toString() //'800'
      ..height = fullScreenHeight(context).toString()
      // ignore: unsafe_html, necessary to load HTML string
      ..srcdoc = constructHtml(viewId, widget.html)
      ..style.border = 'none'
      ..style.overflow = 'hidden'
      ..onLoad.listen((event) async {
        var data = <String, Object>{'type': 'toIframe: getHeight'};
        data['view'] = viewId;
/*
        var data2 = <String, Object>{'type': 'toIframe: setInputType'};
        data2['view'] = viewId;
*/
        final jsonEncoder = JsonEncoder();
        var jsonStr = jsonEncoder.convert(data);
//        var jsonStr2 = jsonEncoder.convert(data2);
        html.window.onMessage.listen((event) {
          var data = json.decode(event.data);
          if (data['type'] != null &&
              data['type'].contains('toDart: htmlHeight') &&
              data['view'] == viewId) {
            final docHeight = data['height'] ?? actualHeight;
            if ((docHeight != null && docHeight != actualHeight) &&
                mounted &&
                docHeight > 0) {
              setState(mounted, this.setState, () {
                actualHeight = docHeight;
              });
            }
          }
        });
        html.window.postMessage(jsonStr, '*');
/*
        html.window.postMessage(jsonStr2, '*');
*/
      });
    // ignore:undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(viewId, (int viewId) => iframe);
    setState(mounted, this.setState, () {
      initialised = Future.value(true);
    });
  }

  String constructHtml(String createdViewId, String theHtml) => """
<html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
      <!--
      <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
      <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
      <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
      -->
      <style>
      body {
        overflow: hidden; /* Hide scrollbars */
      }
      </style>
  </head>
  <body>
  <script type="text/javascript">
    window.parent.addEventListener('message', handleMessage, false);
    function handleMessage(e) {
      if (e && e.data && e.data.includes("toIframe:")) {
        var data = JSON.parse(e.data);
        if (data["view"].includes("$createdViewId")) {
          if (data["type"].includes("getHeight")) {
            var height = document.body.scrollHeight;
            window.parent.postMessage(JSON.stringify({"view": "$createdViewId", "type": "toDart: htmlHeight", "height": height}), "*");
          }
        }
      }
    }
  </script>
  <style>
    body {
        display: block;
        margin: 0px;
    }
    .note-editor.note-airframe, .note-editor.note-frame {
        border: 0px solid #a9a9a9;
    }
    .note-frame {
        border-radius: 0px;
    }
  </style>
  $theHtml
  </body>
</html>
""";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: actualHeight,
      child: Column(
        children: <Widget>[
          Expanded(
              child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: FutureBuilder<bool>(
                      future: initialised,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return HtmlElementView(
                            viewType: viewId,
                          );
                        } else {
                          return Container(height: actualHeight);
                        }
                      }))),
        ],
      ),
    );
  }
}
