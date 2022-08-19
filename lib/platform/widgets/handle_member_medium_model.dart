import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/tools/storage/medium_helper.dart';
import 'package:eliud_core/tools/tool_set.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:eliud_core/tools/storage/member_medium_helper.dart';

import 'handle_medium_model.dart';

typedef MemberMediumModelCallback(MemberMediumModel memberMediumModel);

class HandleMemberMediumModel extends HandleMediumModel {
  final MemberMediumModelCallback memberMediumModelCallback;
  final MemberMediumAccessibleByGroup accessibleByGroup;
  final List<String>? accessibleByMembers;

  HandleMemberMediumModel(AppModel app, String ownerId, this.memberMediumModelCallback, this.accessibleByGroup, { this.accessibleByMembers})
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
        '\${IDENTIFIER}': memberMediumModel.documentID,
      });
    } else {
      htmlCode = process(kIngHtml, parameters: <String, String>{
        '\${IMG_URL}': memberMediumModel.url!,
        '\${IDENTIFIER}': memberMediumModel.documentID,
      });
    }

    memberMediumModelCallback(memberMediumModel);

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
<!--  Member Medium with ID = '\${IDENTIFIER}'
-->
<img src="\${IMG_URL}"/>
""";
