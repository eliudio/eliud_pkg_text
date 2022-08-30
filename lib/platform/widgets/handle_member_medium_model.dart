import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/storage/medium_helper.dart';
import 'package:eliud_core/tools/tool_set.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:eliud_core/tools/storage/member_medium_helper.dart';

import 'handle_medium_model.dart';
import 'html_util.dart';

typedef MemberMediumModelCallback(String memberMediumDocumentId, MemberMediumModel memberMediumModel);

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
    var htmlReference = newRandomKey();
    if (insertFileType == InsertFileType.video) {
      htmlCode = constructHtmlForVideo(memberMediumModel.url!, kDOCUMENT_LABEL_MEMBER, htmlReference);
    } else {
      htmlCode = constructHtmlForImg(memberMediumModel.url!, kDOCUMENT_LABEL_MEMBER, htmlReference);
    }

    memberMediumModelCallback(htmlReference, memberMediumModel,);

    controller.insertHtml(htmlCode);
    return false;
  }
}
