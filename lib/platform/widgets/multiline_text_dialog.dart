import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/_default/frontend/helper/dialog/dialog_helper.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_widget.dart';
import 'package:flutter/material.dart';

import '../text_platform.dart';

class MultilineTextDialog extends StatefulWidget {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.9;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.9;

  final AppModel app;
  final String title;
  final UpdatedHtml updatedHtml;
  final String initialValue;
  final String ownerId;
  final List<String> readAccess;

  MultilineTextDialog({
    super.key,
    required this.title,
    required this.updatedHtml,
    required this.initialValue,
    required this.app,
    required this.ownerId,
    required this.readAccess,
  });

  @override
  State<MultilineTextDialog> createState() => _MultilineTextDialogState();

  static void open(
      BuildContext context,
      AppModel app,
      String ownerId,
      List<String> readAccess,
      String title,
      UpdatedHtml updatedHtml,
      String initialValue) {
    openWidgetDialog(app, context, '${app.documentID}/multilinetext',
        child: MultilineTextDialog(
          title: title,
          updatedHtml: updatedHtml,
          initialValue: initialValue,
          app: app,
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
    return flexibleDialog(widget.app, context,
        title: widget.title, buttons: _buttons(), child: _child());
  }

  @override
  void initState() {
    controller.text = widget.initialValue;
    super.initState();
  }

  List<Widget> _buttons() {
    return [
      Spacer(),
      dialogButton(widget.app, context, onPressed: () {
        Navigator.pop(context);
      }, label: 'Cancel'),
      dialogButton(widget.app, context, onPressed: () async {
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
        controller: controller);
  }
}
