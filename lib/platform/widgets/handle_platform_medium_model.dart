import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/storage/medium_helper.dart';
import 'package:eliud_core/tools/storage/platform_medium_helper.dart';
import 'package:eliud_core/tools/tool_set.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_model.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_model.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:eliud_core/model/member_medium_model.dart';

import 'handle_medium_model.dart';
import 'html_util.dart';

class HandlePlatformMediumModel extends HandleMediumModel {
  final PrivilegeLevelRequiredSimple privilegeLevelRequiredSimple;
  final HtmlWithPlatformMediumModel htmlModel;

    HandlePlatformMediumModel(this.htmlModel, AppModel app, String ownerId, this.privilegeLevelRequiredSimple)
      : super(app, ownerId);

  @override
  MediumHelper getMediumHelper() {
    return PlatformMediumHelper(
      app,
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
    var htmlReference = newRandomKey();
    if (insertFileType == InsertFileType.video) {
      htmlCode = constructHtmlForVideo(platformMediumModel.url!, kDOCUMENT_LABEL_PLATFORM, htmlReference);
    } else {
      htmlCode = constructHtmlForImg(platformMediumModel.url!, kDOCUMENT_LABEL_PLATFORM, htmlReference);
    }

    if (htmlModel.htmlMedia == null) {
      htmlModel.htmlMedia = [];
    }
    htmlModel.htmlMedia!.add(HtmlPlatformMediumModel(
      documentID: newRandomKey(),
      htmlReference: htmlReference,
      medium: platformMediumModel,
    ));

    controller.insertHtml(htmlCode);
    return false;
  }
}

