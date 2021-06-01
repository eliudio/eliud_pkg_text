import 'package:eliud_core/tools/widgets/dialog_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:eliud_core/tools/storage/basename_helper.dart';
import 'package:eliud_core/tools/storage/member_medium_helper.dart';

typedef RichTextFeedback(String value);

class RichTextDialog extends StatefulWidget {
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
    required this.initialValue, required this.appId, required this.ownerId, required this.readAccess,
  }) : super(key: key);

  @override
  _RichTextDialogState createState() => _RichTextDialogState();

  static void open(BuildContext context, String appId, String ownerId, List<String> readAccess, String title,
      RichTextFeedback richTextFeedback, String initialValue) {
    DialogStatefulWidgetHelper.openIt(
        context,
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
  final DialogStateHelper dialogHelper = DialogStateHelper();
  final HtmlEditorController controller = HtmlEditorController();
  bool isHtml = false;

  bool _shouldUseNativeGrid(BuildContext context) {
    double height = DialogStatefulWidgetHelper.height(context);
    return  (height > 450) ;
  }

  @override
  Widget build(BuildContext context) {
    return dialogHelper.build(
        dialogButtonPosition: DialogButtonPosition.TopRight,
        title: widget.title,
        contents: GestureDetector(
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
              toolbarType: _shouldUseNativeGrid(context) ? ToolbarType.nativeGrid : ToolbarType.nativeScrollable,
              mediaUploadInterceptor: (platformFile, insertFileType) => _interceptUpload(platformFile, insertFileType)
            ),
            otherOptions: OtherOptions(
                height: DialogStatefulWidgetHelper.height(context) - 130),
          ),
        ),
        buttons: [
          TextButton(
              onPressed: isHtml ?  () {
                isHtml = false;
                controller.toggleCodeView();
                setState(() {});
              } : null,
              child: Text('Wysisyg')),
          TextButton(
              onPressed: !isHtml ? () {
                isHtml = true;
                controller.toggleCodeView();
                setState(() {});
              } : null,
              child: Text('Html')),
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: Text('Done'),
            onPressed: () async {
              Navigator.pop(context);
              widget.richTextFeedback(await controller.getText());
            },
          ),
        ]);
  }

  void _feedbackProgress(double progress) {
    // show some indicator somewhere to indicate uploading data
  }

  Future<bool> _interceptUpload(PlatformFile platformFile, InsertFileType insertFileType) async {
    if (insertFileType == InsertFileType.audio) return false;
    var bytes = platformFile.bytes;

    // Conditions where we pass control to the internal html editor
    if (bytes == null) return true;
    // ignore: unnecessary_null_comparison
    if (platformFile.name == null) return true;
    if (insertFileType == InsertFileType.audio) return true;

    // All good
    var baseName = platformFile.name!;
    var thumbnailBaseName = BaseNameHelper.baseNameExt(baseName, 'thumbnail.png');
    var memberMediumModel = await MemberMediumHelper.createThumbnailUploadPhotoData(widget.appId, bytes, baseName, thumbnailBaseName, widget.ownerId, widget.readAccess, feedbackProgress: _feedbackProgress);

    String htmlCode;
    if (insertFileType == InsertFileType.video) {
      htmlCode = "<img src=" + memberMediumModel.urlThumbnail! + "/>";
    } else {
      htmlCode = "<img src=" + memberMediumModel.url! + "/>";
    }
    controller.insertHtml(htmlCode);
    return false;
  }
}
