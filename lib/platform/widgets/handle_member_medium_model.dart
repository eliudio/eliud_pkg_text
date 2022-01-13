import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/tools/storage/medium_helper.dart';
import 'package:eliud_core/tools/tool_set.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:eliud_core/tools/storage/member_medium_helper.dart';

import 'handle_medium_model.dart';

class HandleMemberMediumModel extends HandleMediumModel {
  final MemberMediumAccessibleByGroup accessibleByGroup;
  final List<String>? accessibleByMembers;

  HandleMemberMediumModel(AppModel app, String ownerId, this.accessibleByGroup, { this.accessibleByMembers})
      : super(app, ownerId);

  @override
  MediumHelper getMediumHelper() {
    return MemberMediumHelper(
      app,
      ownerId,
      accessibleByGroup,
      accessibleByMembers: accessibleByMembers,
    );
  }

  @override
  Future<bool> toHtml(
      HtmlEditorController controller,
      InsertFileType insertFileType,
      dynamic memberMediumModel) async {
    String htmlCode;
    if (insertFileType == InsertFileType.video) {
      htmlCode = process(kVideoHtml, parameters: <String, String>{
        '\${VIDEO_URL}': memberMediumModel.url!,
        '\${IDENTIFIER}': memberMediumModel.documentID!,
      });
    } else {
      htmlCode = process(kIngHtml, parameters: <String, String>{
        '\${IMG_URL}': memberMediumModel.url!,
        '\${IDENTIFIER}': memberMediumModel.documentID!,
      });
    }

    controller.insertHtml(htmlCode);
    return false;
  }
}

const kVideoHtml = """
<figure>
  <!--  Member Medium with ID = '\${IDENTIFIER}'
  -->
  <video controls width="320" height="176">
    <source src="\${VIDEO_URL}">
    Your browser does not support HTML5 video.
  </video>
</figure>
""";

const kIngHtml = """
<figure>
  <!--  Member Medium with ID = '\${IDENTIFIER}'
  -->
  <img src="\${IMG_URL}" width="250" height="171" />
    <source src="\${VIDEO_URL}">
</figure>
""";
