import 'package:eliud_core/default_style/frontend/impl/dialog/dialog_helper.dart';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/tool_set.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:eliud_core/tools/storage/basename_helper.dart';
import 'package:eliud_core/tools/storage/member_medium_helper.dart';

import '../text_platform.dart';

class HtmlTextDialog extends StatefulWidget {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.9;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.9;

  final String appId;
  final String title;
  final UpdatedHtml updatedHtml;
  final String initialValue;
  final String ownerId;
  final List<String> readAccess;

  HtmlTextDialog({
    Key? key,
    required this.title,
    required this.updatedHtml,
    required this.initialValue,
    required this.appId,
    required this.ownerId,
    required this.readAccess,
  }) : super(key: key);

  @override
  _HtmlTextDialogState createState() => _HtmlTextDialogState();

  static void open(
      BuildContext context,
      String appId,
      String ownerId,
      List<String> readAccess,
      String title,
      UpdatedHtml updatedHtml,
      String initialValue) {
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle().dialogStyle().openWidgetDialog(context,
        child:
        HtmlTextDialog(
          title: title,
          updatedHtml: updatedHtml,
          initialValue: initialValue,
          appId: appId,
          ownerId: ownerId,
          readAccess: readAccess,
        ));
  }
}

class _HtmlTextDialogState extends State<HtmlTextDialog> {
  final HtmlEditorController controller = HtmlEditorController();
  bool isHtml = false;
  double _progress = 1;

  bool _shouldUseNativeGrid(BuildContext context) {
    double height = HtmlTextDialog.height(context);
    return (height > 820);
  }

  final DialogStateHelper dialogHelper = DialogStateHelper();
  @override
  Widget build(BuildContext context) {
    return StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle().dialogWidgetStyle().flexibleDialog(
        context,
        title: widget.title,
        buttons: _buttons(),
        child: _child());
  }

  void _feedbackProgress(double progress) {}

  List<Widget> _buttons() {
    return [
      StyleRegistry.registry()
          .styleWithContext(context)
          .frontEndStyle().buttonStyle().dialogButton(context,
          onPressed: isHtml
              ? () {
            isHtml = false;
            controller.toggleCodeView();
            setState(() {});
          }
              : null,
          label: 'Visual'),
      StyleRegistry.registry()
          .styleWithContext(context)
          .frontEndStyle().buttonStyle().dialogButton(
        context,
        label: 'Html',
        onPressed: !isHtml
            ? () {
          isHtml = true;
          controller.toggleCodeView();
          setState(() {});
        }
            : null,
      ),
      Spacer(),
      StyleRegistry.registry()
          .styleWithContext(context)
          .frontEndStyle().buttonStyle().dialogButton(context, onPressed: () {
        Navigator.pop(context);
      }, label: 'Cancel'),
      StyleRegistry.registry()
          .styleWithContext(context)
          .frontEndStyle().buttonStyle().dialogButton(context,
          onPressed: () async {
            Navigator.pop(context);
            widget.updatedHtml(await controller.getText());
          }, label: 'Done'),
    ];
  }

  Widget _child() {
    return /*GestureDetector(
      onTap: () {
        if (!kIsWeb) {
          controller.clearFocus();
        }
      },
      child: */
      HtmlEditor(
        controller: controller,
        htmlEditorOptions: HtmlEditorOptions(
          shouldEnsureVisible: true,
          initialText: widget.initialValue,
        ),
        htmlToolbarOptions: HtmlToolbarOptions(
            toolbarPosition: ToolbarPosition.aboveEditor,
            toolbarType: _shouldUseNativeGrid(context)
                ? ToolbarType.nativeGrid
                : ToolbarType.nativeScrollable,
            mediaUploadInterceptor: (platformFile, insertFileType) =>
                _interceptUpload(platformFile, insertFileType)),
        otherOptions: OtherOptions(height: HtmlTextDialog.height(context) - 130),
      );
/*
      ,
    );
*/
  }

  Future<bool> _interceptUpload(
      PlatformFile platformFile, InsertFileType insertFileType) async {
    if (insertFileType == InsertFileType.audio) return false;
    var bytes = platformFile.bytes;

    // Conditions where we pass control to the internal html editor
    if (bytes == null) return true;
    if (insertFileType == InsertFileType.audio) return true;

    // All good
    var memberMediumModel;
    var baseName = platformFile.name;
    var thumbnailBaseName = BaseNameHelper.baseNameExt(baseName, 'thumbnail.png');
    if (insertFileType == InsertFileType.video) {
      memberMediumModel = await MemberMediumHelper.createThumbnailUploadVideoData(
          widget.appId,
          bytes,
          baseName,
          thumbnailBaseName,
          widget.ownerId,
          widget.readAccess,
          feedbackProgress: _feedbackProgress);
    } else {
      memberMediumModel = await MemberMediumHelper.createThumbnailUploadPhotoData(
          widget.appId,
          bytes,
          baseName,
          thumbnailBaseName,
          widget.ownerId,
          widget.readAccess,
          feedbackProgress: _feedbackProgress);
    }

    String htmlCode;
    if (insertFileType == InsertFileType.video) {
      htmlCode = process(kVideoHtml, parameters: <String, String>
      {
        '\${VIDEO_URL}': memberMediumModel.url!,
        '\${IDENTIFIER}': memberMediumModel!.documentID!,
      });
    } else {
      htmlCode = process(kIngHtml, parameters: <String, String>
      {
        '\${IMG_URL}': memberMediumModel.url!,
        '\${IDENTIFIER}': memberMediumModel!.documentID!,
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

