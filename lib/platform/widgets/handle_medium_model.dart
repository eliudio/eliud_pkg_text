import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/storage/medium_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:eliud_core/tools/storage/basename_helper.dart';

typedef void SetProgress(double? progress);

abstract class HandleMediumModel {
  String appId;
  String ownerId;

  HandleMediumModel(this.appId, this.ownerId);

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


