import 'package:eliud_core/style/_default/frontend/helper/dialog/dialog_helper.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../text_platform.dart';

class MultilineTextDialog extends StatefulWidget {
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

  MultilineTextDialog({
    Key? key,
    required this.title,
    required this.updatedHtml,
    required this.initialValue,
    required this.appId,
    required this.ownerId,
    required this.readAccess,
  }) : super(key: key);

  @override
  _MultilineTextDialogState createState() => _MultilineTextDialogState();

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
        MultilineTextDialog(
          title: title,
          updatedHtml: updatedHtml,
          initialValue: initialValue,
          appId: appId,
          ownerId: ownerId,
          readAccess: readAccess,
        ));
  }
}

class _MultilineTextDialogState extends State<MultilineTextDialog> {
  final TextEditingController controller = TextEditingController();

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

  @override
  void initState() {
    controller.text = widget.initialValue;
    super.initState();
  }

  List<Widget> _buttons() {
    return [
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
            widget.updatedHtml(controller.text);
          }, label: 'Done'),
    ];
  }

  Widget _child() {
    return TextField(
        keyboardType: TextInputType.multiline,
        minLines: 4,
        maxLines: null,
        controller: controller
    );
  }

}