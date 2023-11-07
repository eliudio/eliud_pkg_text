import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_event.dart';
import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_state.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_pkg_medium/tools/media_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_model.dart';

import '../../model/html_platform_medium_model.dart';
import 'bloc/html_with_platform_medium_component_bloc.dart';
import 'html_text_dialog.dart';
import 'html_util.dart';

class HtmlWithPlatformMediumComponents extends StatefulWidget {
  static Future<void> openIt(
    AppModel app,
    BuildContext context,
    HtmlWithPlatformMediumModel model,
    EditorFeedback editorFeedback, {
    AddMediaHtml? addMediaHtml,
  }) async {
    await openComplexDialog(
      app,
      context,
      '${app.documentID}/html_components',
      title: 'Images and Videos',
      includeHeading: false,
      widthFraction: .9,
      child: getWidget(app, context, model, editorFeedback,
          addMediaHtml: addMediaHtml),
    );
  }

  static Widget getWidget(
    AppModel app,
    BuildContext context,
    HtmlWithPlatformMediumModel model,
    EditorFeedback editorFeedback, {
    AddMediaHtml? addMediaHtml,
  }) {
    return PointerInterceptor(
        child: BlocProvider<HtmlPlatformMediumBloc>(
            create: (context) => HtmlPlatformMediumBloc(
                  app.documentID,
                )..add(ExtEditorBaseInitialise<HtmlWithPlatformMediumModel>(
                    model,
                    reretrieveModel: false)),
            child: HtmlWithPlatformMediumComponents._(
              app: app,
              addMediaHtml: addMediaHtml,
              editorFeedback: editorFeedback,
            )));
  }

  final AppModel app;
  final AddMediaHtml? addMediaHtml;
  final EditorFeedback editorFeedback;

  const HtmlWithPlatformMediumComponents._({
    required this.app,
    this.addMediaHtml,
    required this.editorFeedback,
  });

  @override
  State<StatefulWidget> createState() =>
      _HtmlWithPlatformMediumComponentsState();
}

class _HtmlWithPlatformMediumComponentsState
    extends State<HtmlWithPlatformMediumComponents> {
  double? uploadingProgress;
  Offset? onTapPosition;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HtmlPlatformMediumBloc,
            ExtEditorBaseState<HtmlWithPlatformMediumModel>>(
        builder: (ppContext, htmlWithPMM) {
      if (htmlWithPMM
          is ExtEditorBaseInitialised<HtmlWithPlatformMediumModel, dynamic>) {
        return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
          if (widget.addMediaHtml != null)
            HeaderWidget(
              title: 'Media',
              app: widget.app,
              okAction: () async {
                widget.editorFeedback(true, htmlWithPMM.model);
                return true;
              },
              cancelAction: () async {
                widget.editorFeedback(false, null);
                return true;
              },
            ),
          _images(context, htmlWithPMM.model, htmlWithPMM.model.htmlMedia,
              htmlWithPMM),
        ]);
      } else {
        return progressIndicator(widget.app, context);
      }
    });
  }

  Widget _images(
      BuildContext context,
      HtmlWithPlatformMediumModel htmlWithPlatformMediumModel,
      List<HtmlPlatformMediumModel>? htmlPlatformMediumModels,
      ExtEditorBaseInitialised htmlWithPMM) {
    var widgets = <Widget>[];
    if (htmlPlatformMediumModels != null) {
      for (var i = 0; i < htmlPlatformMediumModels.length; i++) {
        var item = htmlPlatformMediumModels[i];
        var medium = item.medium;
        if (medium != null) {
          widgets.add(GestureDetector(
              onTapDown: (TapDownDetails details) =>
                  onTapPosition = details.globalPosition,
              onTap: () async {
                var x = onTapPosition == null
                    ? fullScreenWidth(context) / 2
                    : onTapPosition!.dx;
                var y = onTapPosition == null
                    ? fullScreenHeight(context) / 2
                    : onTapPosition!.dy;
                var value = await showMenu<int>(
                  context: context,
                  position: RelativeRect.fromLTRB(x, y, x, y),
                  items: [
                    if (widget.addMediaHtml != null)
                      PopupMenuItem<int>(child: const Text('Select'), value: 0),
                    if (widget.addMediaHtml == null)
                      PopupMenuItem<int>(child: const Text('View'), value: 1),
                    PopupMenuItem<int>(child: const Text('Move up'), value: 2),
                    PopupMenuItem<int>(
                        child: const Text('Move down'), value: 3),
                    PopupMenuItem<int>(child: const Text('Delete'), value: 4),
                  ],
                  elevation: 8.0,
                );

                switch (value) {
                  case 0:
                    widget.editorFeedback(true, htmlWithPlatformMediumModel);
                    if (medium.mediumType == PlatformMediumType.photo) {
                      var htmlCode = constructHtmlForImg(medium.url!,
                          kDocumentLabelPlatform, item.htmlReference!);
                      widget.addMediaHtml!(htmlCode);
                    } else {
                      var htmlCode = constructHtmlForVideo(medium.url!,
                          kDocumentLabelPlatform, item.htmlReference!);
                      widget.addMediaHtml!(htmlCode);
                    }
                    Navigator.of(context).pop();
                    break;
                  case 1:
                    Registry.registry()!.getMediumApi().showPhotosPlatform(
                        context,
                        widget.app,
                        htmlPlatformMediumModels.map((e) => e.medium!).toList(),
                        i);
                    break;
                  case 2:
                    BlocProvider.of<HtmlPlatformMediumBloc>(context)
                        .add(HtmlMediaMoveEvent(isUp: true, item: item));
                    break;
                  case 3:
                    BlocProvider.of<HtmlPlatformMediumBloc>(context)
                        .add(HtmlMediaMoveEvent(isUp: false, item: item));
                    break;
                  case 4:
                    if ((item.htmlReference == null) ||
                        ((htmlWithPMM.model.html != null) &&
                            (!htmlWithPMM.model.html
                                .contains(item.htmlReference)))) {
                      BlocProvider.of<HtmlPlatformMediumBloc>(context).add(
                          DeleteItemEvent<HtmlWithPlatformMediumModel,
                              HtmlPlatformMediumModel>(itemModel: item));
                    } else {
                      openErrorDialog(widget.app, context,
                          '${widget.app.documentID}/_error',
                          title: 'Problem',
                          errorMessage:
                              "This medium is used in the html so I can't delete it");
                    }
                    break;
                }
              },
              child: Tooltip(
                  message: _message(item),
                  child: (item == htmlWithPMM.currentEdit
                      ? Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 1),
                          ),
                          child: Image.network(
                            medium.urlThumbnail!,
                            //            height: height,
                          ))
                      : Image.network(
                          medium.urlThumbnail!,
                          //            height: height,
                        )))));
        }
      }
    }
    if (uploadingProgress == null) {
      widgets.add(MediaButtons.platformMediaButtons(
        context,
        widget.app,
        () => htmlWithPlatformMediumModel.conditions == null
            ? PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple
            : htmlWithPlatformMediumModel.conditions!.privilegeLevelRequired!,
        allowCrop: false,
        tooltip: 'Add photo',
        photoFeedbackFunction: (photo) {
          if (photo != null) {
            var newKey = newRandomKey();
            BlocProvider.of<HtmlPlatformMediumBloc>(context).add(AddItemEvent(
                itemModel: HtmlPlatformMediumModel(
                    documentID: newKey, htmlReference: newKey, medium: photo)));
          }
          uploadingProgress = null;
        },
        photoFeedbackProgress: (progress) {
          setState(() {
            uploadingProgress = progress;
          });
        },
        videoFeedbackFunction: (video) {
          if (video != null) {
            var newKey = newRandomKey();
            BlocProvider.of<HtmlPlatformMediumBloc>(context).add(AddItemEvent(
                itemModel: HtmlPlatformMediumModel(
                    documentID: newKey, htmlReference: newKey, medium: video)));
          }
          uploadingProgress = null;
        },
        videoFeedbackProgress: (progress) {
          setState(() {
            uploadingProgress = progress;
          });
        },
        icon: Icon(
          Icons.add,
        ),
      ));
    } else {
      widgets.add(progressIndicatorWithValue(widget.app, context,
          value: uploadingProgress!));
    }

    return GridView.extent(
        maxCrossAxisExtent: 200,
        padding: const EdgeInsets.all(0),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        physics: const ScrollPhysics(),
        // to disable GridView's scrolling
        shrinkWrap: true,
        children: widgets);
  }

  String _message(HtmlPlatformMediumModel? item) {
    if (item == null) {
      return '?';
    } else {
      return '${((item.medium == null) || (item.medium!.base == null)) ? 'no name' : item.medium!.base!}.${((item.medium == null) || (item.medium!.ext == null)) ? 'no ext' : item.medium!.ext!}';
    }
  }
}
