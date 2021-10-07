import 'package:eliud_core/model/conditions_simple_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/storage/medium_helper.dart';
import 'package:eliud_core/tools/storage/platform_medium_helper.dart';
import 'package:eliud_core/tools/tool_set.dart';
import 'package:eliud_pkg_text/model/html_medium_model.dart';
import 'package:eliud_pkg_text/model/html_model.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import 'handle_medium_model.dart';

class HandlePlatformMediumModel extends HandleMediumModel {
  final PrivilegeLevelRequiredSimple privilegeLevelRequiredSimple;
  final HtmlModel htmlModel;

    HandlePlatformMediumModel(this.htmlModel, String appId, String ownerId, this.privilegeLevelRequiredSimple)
      : super(appId, ownerId);

  @override
  MediumHelper getMediumHelper() {
    return PlatformMediumHelper(
      appId,
      ownerId,
      privilegeLevelRequiredSimple,
    );
  }

  @override
  Future<bool> toHtml(
      HtmlEditorController controller,
      InsertFileType insertFileType,
      dynamic platformMediumModel) async {
    String htmlCode;
    if (insertFileType == InsertFileType.video) {
      htmlCode = process(kVideoHtml, parameters: <String, String>{
        '\${VIDEO_URL}': platformMediumModel.url!,
        '\${IDENTIFIER}': platformMediumModel.documentID!,
      });
    } else {
      htmlCode = process(kIngHtml, parameters: <String, String>{
        '\${IMG_URL}': platformMediumModel.url!,
        '\${IDENTIFIER}': platformMediumModel.documentID!,
      });
    }

    if (htmlModel.htmlMedia == null) {
      htmlModel.htmlMedia = [];
    }
    htmlModel.htmlMedia!.add(HtmlMediumModel(
      documentID: newRandomKey(),
      medium: platformMediumModel,
    ));

    controller.insertHtml(htmlCode);
    return false;
  }
}

const kVideoHtml = """
<figure>
  <!--  Platform Medium with ID = '\${IDENTIFIER}'
  -->
  <video controls width="320" height="176">
    <source src="\${VIDEO_URL}">
    Your browser does not support HTML5 video.
  </video>
</figure>
""";

const kIngHtml = """
<!--  Platform Medium with ID = '\${IDENTIFIER}'
-->
<img src="\${IMG_URL}" width="250" height="171" />
""";
