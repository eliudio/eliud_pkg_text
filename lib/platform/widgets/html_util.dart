import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/tools/tool_set.dart';
import 'package:html/parser.dart' show parse;

import 'package:html/dom.dart';

import '../../model/html_with_platform_medium_entity.dart';

Future<HtmlWithPlatformMediumEntity> reviewLinksForHtmlWithPlatformMediumEntity(
    AppModel app,
    HtmlWithPlatformMediumEntity htmlWithPlatformMediumEntity) async {
  if (htmlWithPlatformMediumEntity.htmlMedia != null) {
    var html = htmlWithPlatformMediumEntity.html;
    if (html != null) {
      var document = parse(html);
      for (var platformMedium in htmlWithPlatformMediumEntity.htmlMedia!) {
        var htmlReference = platformMedium.htmlReference;
        if (htmlReference != null) {
          var medium = await platformMediumRepository(appId: app.documentID)!
              .get(platformMedium.mediumId);
          if ((medium != null) && (medium.mediumType != null)) {
            document = replaceMedium(
                platformMediumTypeToHtmlMediumType(medium.mediumType!),
                document,
                kDocumentLabelPlatform,
                htmlReference,
                medium.url!);
          }
          var newHtml = document.outerHtml;
          html = newHtml;
        }
      }
      return htmlWithPlatformMediumEntity.copyWith(html: html);
    }
  }
  return htmlWithPlatformMediumEntity;
}

// replaces existing link with a new link
String replaceMemberMedium(MediumType memberMediumType, String html,
    String htmlReference, String url) {
  var document = parse(html);
  var newDocument = replaceMedium(
      memberMediumTypeToHtmlMediumType(memberMediumType),
      document,
      kDocumentLabelMember,
      htmlReference,
      url);
  return newDocument.outerHtml;
}

String replacePlatformMedium(PlatformMediumType platformMediumType, String html,
    String htmlReference, String url) {
  var document = parse(html);
  var newDocument = replaceMedium(
      platformMediumTypeToHtmlMediumType(platformMediumType),
      document,
      kDocumentLabelPlatform,
      htmlReference,
      url);
  var returnMe = newDocument.outerHtml;
  return returnMe;
}

enum HtmlMediumType { img, video, unknown }

HtmlMediumType memberMediumTypeToHtmlMediumType(MediumType memberMediumType) {
  switch (memberMediumType) {
    case MediumType.photo:
      return HtmlMediumType.img;
    case MediumType.video:
      return HtmlMediumType.video;
    case MediumType.pdf:
      break;
    case MediumType.text:
      break;
    case MediumType.unknown:
      break;
  }
  return HtmlMediumType.unknown;
}

HtmlMediumType platformMediumTypeToHtmlMediumType(
    PlatformMediumType platformMediumType) {
  switch (platformMediumType) {
    case PlatformMediumType.photo:
      return HtmlMediumType.img;
    case PlatformMediumType.video:
      return HtmlMediumType.video;
    case PlatformMediumType.pdf:
      break;
    case PlatformMediumType.text:
      break;
    case PlatformMediumType.unknown:
      break;
  }
  return HtmlMediumType.unknown;
}

Document replaceMedium(HtmlMediumType htmlMediumType, Document document,
    String htmlReferenceLabel, String htmlReference, String url) {
  if (htmlMediumType == HtmlMediumType.img) {
    var images = document.getElementsByTagName("img");
    for (var image in images) {
      var attributes = image.attributes;
      var mediumAttribute = attributes[htmlReferenceLabel];
      if (mediumAttribute == htmlReference) {
        var newHtml =
            constructHtmlForImg(url, htmlReferenceLabel, htmlReference);
        var newElement = Element.html(newHtml);
        image.replaceWith(newElement);
      }
    }
    return document;
  } else if (htmlMediumType == HtmlMediumType.video) {
    var videos = document.getElementsByTagName("img");
    for (var video in videos) {
      var attributes = video.attributes;
      var mediumAttribute = attributes[htmlReferenceLabel];
      if (mediumAttribute == htmlReference) {
        var newHtml =
            constructHtmlForVideo(url, htmlReferenceLabel, htmlReference);
        var newElement = Element.html(newHtml);
        video.replaceWith(newElement);
      }
    }
    return document;
  } else {
    return document;
  }
}

const kDocumentLabelPlatform = "eliud_html_platform_medium_html_reference";
const kDocumentLabelMember = "eliud_html_member_medium_html_reference";

const kVideoHtml = """
<video controls width="320" height="176"><source src="\${VIDEO_URL}" \${HTML_REF_LABEL}="\${HTML_REF_ID}">Your browser does not support HTML5 video</video>
""";

const kImgHtml = """
<img src="\${IMG_URL}" \${HTML_REF_LABEL}="\${HTML_REF_ID}"/> 
""";

String constructHtmlForImg(
    String url, String htmlRefLabel, String htmlReference) {
  return process(kImgHtml, parameters: <String, String>{
    '\${IMG_URL}': url,
    '\${HTML_REF_LABEL}': htmlRefLabel,
    '\${HTML_REF_ID}': htmlReference,
  });
}

String constructHtmlForVideo(
    String url, String htmlRefLabel, String htmlReference) {
  return process(kVideoHtml, parameters: <String, String>{
    '\${VIDEO_URL}': url,
    '\${HTML_REF_LABEL}': htmlRefLabel,
    '\${HTML_REF_ID}': htmlReference,
  });
}
