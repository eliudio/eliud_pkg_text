import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
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
    StyleRegistry.registry().styleWithContext(context).frontEndStyle().dialogStyle().openWidgetDialog(context, child: RichTextView(value: value));
  }
}

class _RichTextViewState extends State<RichTextView> {
  @override
  Widget build(BuildContext context) {
    return StyleRegistry.registry().styleWithContext(context).frontEndStyle().dialogWidgetStyle().flexibleDialog(context,
        title: "Test",
        child: HtmlWidget(widget.value),
        buttons: [
          StyleRegistry.registry()
              .styleWithContext(context)
              .frontEndStyle()
              .buttonStyle().dialogButton(
            context,
            label: 'Done',
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
        ]);
  }
}
