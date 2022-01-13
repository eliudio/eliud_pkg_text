import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/storage/medium_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:eliud_core/tools/storage/basename_helper.dart';

typedef void SetProgress(double? progress);

/*
 * Class used to handle uploading of photos or videos when updating html.
 *
 * TODO: We should consider for the container (Html itself) to hold a list of MemberMediumModels or PlatformMediumModels
 * to allow to maintain this list when maintaining the container. E.g. when access rights change or when
 * the container gets deleted.
 *
 */
abstract class HandleMediumModel {
  AppModel app;
  String ownerId;

  HandleMediumModel(this.app, this.ownerId);

  Future<bool> interceptUploadWithPath(
      HtmlEditorController controller,
      PlatformFile platformFile,
      InsertFileType insertFileType,
      SetProgress setProgress) async {
    setProgress(0);

    if (insertFileType == InsertFileType.audio) return false;
    var path = platformFile.path;

    // Conditions where we pass control to the internal html editor
    if (path == null) return true;
    if (insertFileType == InsertFileType.audio) return true;

    // All good
    var mediumModel;
    var mediumDocumentID = newRandomKey();
    if (insertFileType == InsertFileType.video) {
      mediumModel = await getMediumHelper()
          .createThumbnailUploadVideoFile(mediumDocumentID, path,
          feedbackProgress: setProgress);
    } else {
      mediumModel = await getMediumHelper().createThumbnailUploadPhotoFile(mediumDocumentID, path,
          feedbackProgress: setProgress);
    }

    setProgress(null);
    return toHtml(controller, insertFileType, mediumModel);
  }

  MediumHelper getMediumHelper();

  Future<bool> interceptUploadWithBytes(
      HtmlEditorController controller,
      PlatformFile platformFile,
      InsertFileType insertFileType,
      SetProgress setProgress) async {
    if (!kIsWeb) {
      setProgress(0);
    }
    if (insertFileType == InsertFileType.audio) return false;
    var bytes = platformFile.bytes;

    // Conditions where we pass control to the internal html editor
    if (bytes == null) return true;
    if (insertFileType == InsertFileType.audio) return true;

    // All good
    var mediumModel;
    var mediumDocumentID = newRandomKey();
    var baseName = mediumDocumentID + '.' + platformFile.name;
    var thumbnailBaseName = BaseNameHelper.baseNameExt(
        mediumDocumentID, baseName, 'thumbnail.png');
    if (insertFileType == InsertFileType.video) {
      mediumModel = await getMediumHelper().createThumbnailUploadVideoData(
          mediumDocumentID, bytes, baseName, thumbnailBaseName,
          feedbackProgress: setProgress);
    } else {
      mediumModel = await getMediumHelper().createThumbnailUploadPhotoData(
          mediumDocumentID, bytes, baseName, thumbnailBaseName,
          feedbackProgress: setProgress);
    }

    setProgress(null);
    return toHtml(controller, insertFileType, mediumModel);
  }

  Future<bool> toHtml(
      HtmlEditorController controller,
      InsertFileType insertFileType,
      dynamic memberMediumModel);}


