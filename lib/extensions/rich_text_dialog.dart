import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:eliud_core/tools/storage/basename_helper.dart';
import 'package:eliud_core/tools/storage/member_medium_helper.dart';

typedef RichTextFeedback(String value);

class RichTextDialog extends StatefulWidget {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.9;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.9;

  final String appId;
  final String title;
  final RichTextFeedback richTextFeedback;
  final String initialValue;
  final String ownerId;
  final List<String> readAccess;

  RichTextDialog({
    Key? key,
    required this.title,
    required this.richTextFeedback,
    required this.initialValue,
    required this.appId,
    required this.ownerId,
    required this.readAccess,
  }) : super(key: key);

  @override
  _RichTextDialogState createState() => _RichTextDialogState();

  static void open(
      BuildContext context,
      String appId,
      String ownerId,
      List<String> readAccess,
      String title,
      RichTextFeedback richTextFeedback,
      String initialValue) {
    StyleRegistry.registry().styleWithContext(context).frontEndStyle().openWidgetDialog(context, child:
        RichTextDialog(
          title: title,
          richTextFeedback: richTextFeedback,
          initialValue: initialValue,
          appId: appId,
          ownerId: ownerId,
          readAccess: readAccess,
        ));
  }
}

class _RichTextDialogState extends State<RichTextDialog> {
  final HtmlEditorController controller = HtmlEditorController();
  bool isHtml = false;
  double _progress = 1;

  bool _shouldUseNativeGrid(BuildContext context) {
    double height = RichTextDialog.height(context);
    return (height > 820);
  }

  @override
  Widget build(BuildContext context) {
    var frontEndStyle =
        StyleRegistry.registry().styleWithContext(context).frontEndStyle();
    return  StyleRegistry.registry().styleWithContext(context).frontEndStyle().flexibleDialog(
      context,
      title: widget.title,
      buttons: [
        frontEndStyle.dialogButton(context,
            onPressed: isHtml
                ? () {
                    isHtml = false;
                    controller.toggleCodeView();
                    setState(() {});
                  }
                : null,
            label: 'Visual'),
        frontEndStyle.dialogButton(
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
        frontEndStyle.dialogButton(context, onPressed: () {
          Navigator.pop(context);
        }, label: 'Cancel'),
        frontEndStyle.dialogButton(context, onPressed: () async {
          Navigator.pop(context);
          widget.richTextFeedback(await controller.getText());
        }, label: 'Done'),
      ],
      child: GestureDetector(
        onTap: () {
          if (!kIsWeb) {
            controller.clearFocus();
          }
        },
        child: HtmlEditor(
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
          otherOptions: OtherOptions(
              height: RichTextDialog.height(context) - 130),
        ),
      ),
//      seperator: LinearProgressIndicator( value:  _progress),
    );
  }

  void _feedbackProgress(double progress) {
/*
    _progress = progress;
    setState(() {});
*/
  }

  Future<bool> _interceptUpload(
      PlatformFile platformFile, InsertFileType insertFileType) async {
    if (insertFileType == InsertFileType.audio) return false;
    var bytes = platformFile.bytes;

    // Conditions where we pass control to the internal html editor
    if (bytes == null) return true;
    // ignore: unnecessary_null_comparison
    if (platformFile.name == null) return true;
    if (insertFileType == InsertFileType.audio) return true;

    // All good
    var baseName = platformFile.name;
    var thumbnailBaseName =
        BaseNameHelper.baseNameExt(baseName, 'thumbnail.png');
    var memberMediumModel =
        await MemberMediumHelper.createThumbnailUploadPhotoData(
            widget.appId,
            bytes,
            baseName,
            thumbnailBaseName,
            widget.ownerId,
            widget.readAccess,
            feedbackProgress: _feedbackProgress);

    String htmlCode;
    if (insertFileType == InsertFileType.video) {
      htmlCode = "<img src='" + memberMediumModel.urlThumbnail! + "'/>";
    } else {
      htmlCode = "<img src='" + memberMediumModel.url! + "'/>";
    }
    controller.insertHtml(htmlCode);
    return false;
  }
}
