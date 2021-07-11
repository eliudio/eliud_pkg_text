import 'package:eliud_core/default_style/frontend/impl/dialog/dialog_helper.dart';
import 'package:eliud_core/model/member_medium_model.dart';
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
  final List<Widget>? extraIcons;

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
    required this.appId,
    required this.ownerId,
    required this.readAccess,
    required this.isWeb,
    this.extraIcons,
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
      String initialValue,
      bool isWeb, {List<Widget>? extraIcons}) {
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogStyle()
        .openWidgetDialog(context,
            child: HtmlTextDialog(
                title: title,
                updatedHtml: updatedHtml,
                initialValue: initialValue,
                appId: appId,
                ownerId: ownerId,
                readAccess: readAccess,
                isWeb: isWeb,
                extraIcons: extraIcons,));
  }
}

class _HtmlTextDialogState extends State<HtmlTextDialog> {
  final HtmlEditorController controller = HtmlEditorController();
  bool isHtml = false;
  double? _progress;

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
    return StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogWidgetStyle()
        .flexibleDialog(context,
            title: widget.title, buttons: _buttons(), child: _child());
  }

  void _feedbackProgress(double? progress) {
    setProgress(progress);
  }

  List<Widget> _buttons() {
    if (_progress != null) {
      return [
        StyleRegistry.registry()
            .styleWithContext(context)
            .frontEndStyle()
            .progressIndicatorStyle()
            .progressIndicatorWithValue(context, value: _progress!)
      ];
    } else {
      List<Widget> buttons = <Widget>[];
      if (isHtml) {
        buttons.add(StyleRegistry.registry()
            .styleWithContext(context)
            .frontEndStyle()
            .buttonStyle()
            .dialogButton(context, onPressed: () {
          isHtml = false;
          controller.toggleCodeView();
          setState(() {});
        }, label: 'Visual'));
      } else {
        buttons.add(StyleRegistry.registry()
            .styleWithContext(context)
            .frontEndStyle()
            .buttonStyle()
            .dialogButton(context, label: 'Html', onPressed: () {
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
      buttons.add(StyleRegistry.registry()
          .styleWithContext(context)
          .frontEndStyle()
          .buttonStyle()
          .dialogButton(context, onPressed: () {
        Navigator.pop(context);
      }, label: 'Cancel'));
      buttons.add(StyleRegistry.registry()
          .styleWithContext(context)
          .frontEndStyle()
          .buttonStyle()
          .dialogButton(context, onPressed: () async {
        Navigator.pop(context);
        widget.updatedHtml(await controller.getText());
      }, label: 'Done'));
      return buttons;
    }
  }

  Widget _child() {
    if (_progress != null) {
      return /*GestureDetector(
        onTap: () {
          if (!kIsWeb) {
            controller.clearFocus();
          }
        },
        child: */
          HtmlEditor(
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
            toolbarPosition: ToolbarPosition.aboveEditor,
            customToolbarButtons: [
              StyleRegistry.registry()
                  .styleWithContext(context)
                  .frontEndStyle()
                  .progressIndicatorStyle()
                  .progressIndicatorWithValue(context, value: _progress!),
              Spacer(),
            ],
            customToolbarInsertionIndices: [0, 1],
            defaultToolbarButtons: [],
            toolbarType: _shouldUseNativeGrid(context)
                ? ToolbarType.nativeGrid
                : ToolbarType.nativeScrollable,
            mediaUploadInterceptor: (platformFile, insertFileType) =>
                widget.isWeb
                    ? _interceptUploadWithBytes(platformFile, insertFileType)
                    : _interceptUploadWithPath(platformFile, insertFileType)),
        otherOptions:
            OtherOptions(height: HtmlTextDialog.height(context) - 130),
      );
    } else {
      return /*GestureDetector(
        onTap: () {
          if (!kIsWeb) {
            controller.clearFocus();
          }
        },
        child: */
          HtmlEditor(
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
            toolbarPosition: ToolbarPosition.aboveEditor,
            defaultToolbarButtons: [
              StyleButtons(),
              FontSettingButtons(),
              FontButtons(),
              ColorButtons(),
              ListButtons(),
              ParagraphButtons(),
              // Actually it seems video is SUPER unstable and even on mobile sometimes works and sometimes doesn't work. So, I'm disabling this by default
              InsertButtons(audio: false, video: false /*!widget.isWeb*/),
              OtherButtons(codeview: false, fullscreen: false)
            ],
            toolbarType: _shouldUseNativeGrid(context)
                ? ToolbarType.nativeGrid
                : ToolbarType.nativeScrollable,
            mediaUploadInterceptor: (platformFile, insertFileType) =>
                widget.isWeb
                    ? _interceptUploadWithBytes(platformFile, insertFileType)
                    : _interceptUploadWithPath(platformFile, insertFileType)),
        otherOptions:
            OtherOptions(height: HtmlTextDialog.height(context) - 130),
      );
    }
  }

  Future<bool> _toHtml(InsertFileType insertFileType,
      MemberMediumModel memberMediumModel) async {
    String htmlCode;
    if (insertFileType == InsertFileType.video) {
      htmlCode = process(kVideoHtml, parameters: <String, String>{
        '\${VIDEO_URL}': memberMediumModel.url!,
        '\${IDENTIFIER}': memberMediumModel.documentID!,
      });
    } else {
      htmlCode = process(kIngHtml, parameters: <String, String>{
        '\${IMG_URL}': memberMediumModel.url!,
        '\${IDENTIFIER}': memberMediumModel.documentID!,
      });
    }

    controller.insertHtml(htmlCode);
    return false;
  }

  Future<bool> _interceptUploadWithBytes(
      PlatformFile platformFile, InsertFileType insertFileType) async {
    if (!kIsWeb) {
      setProgress(0);
    }
    if (insertFileType == InsertFileType.audio) return false;
    var bytes = platformFile.bytes;

    // Conditions where we pass control to the internal html editor
    if (bytes == null) return true;
    if (insertFileType == InsertFileType.audio) return true;

    // All good
    var memberMediumModel;
    var baseName = platformFile.name;
    var thumbnailBaseName =
        BaseNameHelper.baseNameExt(baseName, 'thumbnail.png');
    if (insertFileType == InsertFileType.video) {
      memberMediumModel =
          await MemberMediumHelper.createThumbnailUploadVideoData(
              widget.appId,
              bytes,
              baseName,
              thumbnailBaseName,
              widget.ownerId,
              widget.readAccess,
              feedbackProgress: _feedbackProgress);
    } else {
      memberMediumModel =
          await MemberMediumHelper.createThumbnailUploadPhotoData(
              widget.appId,
              bytes,
              baseName,
              thumbnailBaseName,
              widget.ownerId,
              widget.readAccess,
              feedbackProgress: _feedbackProgress);
    }

    setProgress(null);
    return _toHtml(insertFileType, memberMediumModel);
  }

  void setProgress(double? progress) {
    if (!kIsWeb) {
      setState(() {
        _progress = progress;
      });
    }
  }

  Future<bool> _interceptUploadWithPath(
      PlatformFile platformFile, InsertFileType insertFileType) async {
    setProgress(0);

    if (insertFileType == InsertFileType.audio) return false;
    var path = platformFile.path;

    // Conditions where we pass control to the internal html editor
    if (path == null) return true;
    if (insertFileType == InsertFileType.audio) return true;

    // All good
    var memberMediumModel;
    if (insertFileType == InsertFileType.video) {
      memberMediumModel =
          await MemberMediumHelper.createThumbnailUploadVideoFile(
              widget.appId, path, widget.ownerId, widget.readAccess,
              feedbackProgress: _feedbackProgress);
    } else {
      memberMediumModel =
          await MemberMediumHelper.createThumbnailUploadPhotoFile(
              widget.appId, path, widget.ownerId, widget.readAccess,
              feedbackProgress: _feedbackProgress);
    }

    setProgress(null);
    return _toHtml(insertFileType, memberMediumModel);
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
