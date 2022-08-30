import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/_default/frontend/helper/dialog/dialog_helper.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_dialog_widget.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../text_platform.dart';
import 'handle_medium_model.dart';
import 'html_with_platform_medium_components.dart';

class HtmlTextDialog extends StatefulWidget {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.9;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.9;

  final AppModel app;
  final String title;
  final UpdatedHtml updatedHtml;
  final String initialValue;
  final String ownerId;
  final List<Widget>? extraIcons;
  final HandleMediumModel handleMediumModel;
  // action when pressing the media button. If no action is provided then no media button available
  final VoidCallback? mediaAction;

  // Unfortunately when uploading files on web, we can not rely on using the path to upload the files. So in that case we rely on the bytes, not the path.
  // i.e. we use _interceptUploadWithBytes or _interceptUploadWithPath depending on this flag.
  // It seems that after uploading video with bytes (on web, as well on mobile when tested) then the uploaded file is correct, so hence we disable uploading video
  // for now.
  // Actually it seems video is SUPER unstable and even on mobile sometimes works and sometimes doesn't work. So, I'm disabling this by default
  final bool isWeb;

  HtmlTextDialog({
    Key? key,
    required this.title,
    required this.updatedHtml,
    required this.initialValue,
    required this.app,
    required this.ownerId,
    required this.isWeb,
    this.extraIcons,
    required this.handleMediumModel,
    required /*temp required*/ this.mediaAction,
  }) : super(key: key);

  @override
  _HtmlTextDialogState createState() => _HtmlTextDialogState();

  static void open(
    BuildContext context,
    AppModel app,
    String ownerId,
    String title,
    UpdatedHtml updatedHtml,
    String initialValue,
    bool isWeb,
    HandleMediumModel handleMediumModel, {
    List<Widget>? extraIcons,
    required VoidCallback mediaAction,
  }) {
    if ((initialValue == null) || (initialValue.length == 0))
      initialValue = ' ';

    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .dialogStyle()
        .openWidgetDialog(app, context, app.documentID + '/html',
            child: HtmlTextDialog(
                title: title,
                updatedHtml: updatedHtml,
                initialValue: initialValue,
                app: app,
                ownerId: ownerId,
                isWeb: isWeb,
                extraIcons: extraIcons,
                handleMediumModel: handleMediumModel,
                mediaAction: mediaAction));
  }
}

class _HtmlTextDialogState extends State<HtmlTextDialog> {
  final HtmlEditorController controller = HtmlEditorController();
  bool isHtml = false;

  @override
  void initState() {
    super.initState();
  }

  bool _shouldUseNativeGrid(BuildContext context) {
    if (kIsWeb) return true; // the nativeScrollable doesn't seem to work
    double height = HtmlTextDialog.height(context);
    return (height > 820);
  }

  final DialogStateHelper dialogHelper = DialogStateHelper();
  @override
  Widget build(BuildContext context) {
    return flexibleDialog(widget.app, context,
        title: widget.title, buttons: _buttons(), child: _child());
  }

  List<Widget> _buttons() {
    List<Widget> buttons = <Widget>[];
    if (isHtml) {
      buttons.add(dialogButton(widget.app, context, onPressed: () {
        isHtml = false;
        controller.toggleCodeView();
        setState(() {});
      }, label: 'Visual'));
    } else {
      buttons
          .add(dialogButton(widget.app, context, label: 'Html', onPressed: () {
        isHtml = true;
        controller.toggleCodeView();
        setState(() {});
      }));
    }
    buttons.add(Spacer());
    if (widget.extraIcons != null) {
      buttons.addAll(widget.extraIcons!);
      buttons.add(Spacer());
    }
    buttons.add(dialogButton(widget.app, context, onPressed: () {
      Navigator.pop(context);
    }, label: 'Cancel'));
    buttons.add(dialogButton(widget.app, context, onPressed: () async {
      Navigator.pop(context);
      widget.updatedHtml(await controller.getText());
    }, label: 'Done'));
    return buttons;
  }

  Widget _mediaButton() {
    return iconButton(widget.app, context,
        icon: Icon(Icons.perm_media_outlined), onPressed: widget.mediaAction);
  }

  Widget _child() {
    return HtmlEditor(
      controller: controller,
      callbacks: Callbacks(onInit: () {
        controller.setFullScreen();
      }),
      htmlEditorOptions: HtmlEditorOptions(
        shouldEnsureVisible: true,
        autoAdjustHeight: false,
        initialText: widget.initialValue,
      ),
      htmlToolbarOptions: HtmlToolbarOptions(
        customToolbarButtons:
            (widget.mediaAction != null) ? [_mediaButton()] : [],
        toolbarPosition: ToolbarPosition.aboveEditor,
        defaultToolbarButtons: [
          StyleButtons(),
          FontSettingButtons(),
          FontButtons(),
          ColorButtons(),
          ListButtons(),
          ParagraphButtons(),
          // Actually it seems video is SUPER unstable and even on mobile sometimes works and sometimes doesn't work. So, I'm disabling this by default
          InsertButtons(audio: false, picture: false, video: false),
          OtherButtons(codeview: false, fullscreen: false)
        ],
        toolbarType: _shouldUseNativeGrid(context)
            ? ToolbarType.nativeGrid
            : ToolbarType.nativeScrollable,
        mediaUploadInterceptor:
            null, /*(platformFile, insertFileType) =>
                widget.isWeb
                    ? widget.handleMediumModel.interceptUploadWithBytes(controller, platformFile, insertFileType, setProgress)
                    : widget.handleMediumModel.interceptUploadWithPath(controller, platformFile, insertFileType, setProgress)*/
      ),
      otherOptions: OtherOptions(height: HtmlTextDialog.height(context) - 130),
    );
  }
}
