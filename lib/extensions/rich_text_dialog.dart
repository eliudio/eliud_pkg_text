import 'package:eliud_core/tools/widgets/dialog_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:html_editor_enhanced/html_editor.dart';

typedef RichTextFeedback(String value);

class RichTextDialog extends StatefulWidget {
  final String title;
  final RichTextFeedback richTextFeedback;
  final String initialValue;

  RichTextDialog({
    Key? key,
    required this.title,
    required this.richTextFeedback,
    required this.initialValue,
  }) : super(key: key);

  @override
  _RichTextDialogState createState() => _RichTextDialogState();

  static void open(BuildContext context, String title,
      RichTextFeedback richTextFeedback, String initialValue) {
    DialogStatefulWidgetHelper.openIt(
        context,
        RichTextDialog(
          title: title,
          richTextFeedback: richTextFeedback,
          initialValue: initialValue,
        ));
  }
}

class _RichTextDialogState extends State<RichTextDialog> {
  final DialogStateHelper dialogHelper = DialogStateHelper();
  final HtmlEditorController controller = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return dialogHelper.build(
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
              toolbarPosition: ToolbarPosition.aboveEditor, //by default
              toolbarType: ToolbarType.nativeGrid, //by default
            ),
            otherOptions: OtherOptions(
                height: DialogStatefulWidgetHelper.height(context) - 130),
          ),
        ),
        buttons: [
          TextButton(
              onPressed: () {
                controller.toggleCodeView();
              },
              child: Text(r'<\>',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () async {
              Navigator.pop(context);
              widget.richTextFeedback(await controller.getText());
            },
          ),
        ]);
  }
}
