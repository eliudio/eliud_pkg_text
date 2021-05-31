import 'package:flutter/cupertino.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class RichTextWidget extends StatelessWidget {
  final String value;

  const RichTextWidget({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HtmlWidget('Hello World!');
  }
}