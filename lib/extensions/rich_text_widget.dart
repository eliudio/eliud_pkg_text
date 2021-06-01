import 'package:flutter/cupertino.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:eliud_core/tools/widgets/dialog_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RichTextView extends StatefulWidget {
  final String value;

  RichTextView({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  _RichTextViewState createState() => _RichTextViewState();

  static void open(BuildContext context, String value) {
    DialogStatefulWidgetHelper.openIt(
        context,
        RichTextView(
          value: value
        ));
  }
}

class _RichTextViewState extends State<RichTextView> {
  final DialogStateHelper dialogHelper = DialogStateHelper();

  @override
  Widget build(BuildContext context) {
    return dialogHelper.build(
        dialogButtonPosition: DialogButtonPosition.TopRight,
        title: "Test",
        contents: HtmlWidget(widget.value),
        buttons: [
          TextButton(
            child: Text('Done'),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
        ]);
  }
}

