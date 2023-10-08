import 'dart:convert';

import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:html_editor_enhanced/utils/utils.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

/*
 * See: webHtmlSolution in web_html_solution.dart
 * This has now become obsolete as apparently the latest version of HtmlWidget works fine on web and mobile without the below funny stuff
 *
 * webHtmlSolution provide similar functionality, ie present html. However
 *    webHtmlSolution does not support video.
 *    webHtmlSolution2 does support video as it uses iframe. However webHtmlSolution2 doesn't allow to open the images when clicked on.
 *    It also doesn't allow to scroll down with the mouse wheel. So webHtmlSolution2 is inferior except that it allows to present videos.
 *    VIDEOs should be used within html carefully. Suggestion is that one creates a page with html with a video and a second component with the
 *    html that does not contain VIDEO. We assume the guys owning flutter_widget_from_html_core or flutter_widget_from_html will eventually
 *    implement VIDEO support on WEB.
 *
 */
Widget webHtmlSolution2(
    BuildContext context, String html) {
  return MyHtmlWidget(html: html);
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
        print("HERE 1");
        var data = <String, Object>{'type': 'toIframe: getHeight'};
        data['view'] = viewId;
        final jsonEncoder = JsonEncoder();
        var jsonStr = jsonEncoder.convert(data);
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
