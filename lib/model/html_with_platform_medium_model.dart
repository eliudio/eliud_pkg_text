/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_with_platform_medium_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_text/model/model_export.dart';
import 'package:eliud_pkg_text/model/entity_export.dart';


import 'package:eliud_pkg_text/model/html_with_platform_medium_entity.dart';




class HtmlWithPlatformMediumModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_text';
  static const String id = 'htmlWithPlatformMediums';

  String documentID;
  String appId;
  String? description;
  String? html;
  List<HtmlPlatformMediumModel>? htmlMedia;
  BackgroundModel? background;
  StorageConditionsModel? conditions;

  HtmlWithPlatformMediumModel({required this.documentID, required this.appId, this.description, this.html, this.htmlMedia, this.background, this.conditions, })  {
  }

  HtmlWithPlatformMediumModel copyWith({String? documentID, String? appId, String? description, String? html, List<HtmlPlatformMediumModel>? htmlMedia, BackgroundModel? background, StorageConditionsModel? conditions, }) {
    return HtmlWithPlatformMediumModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, html: html ?? this.html, htmlMedia: htmlMedia ?? this.htmlMedia, background: background ?? this.background, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ html.hashCode ^ htmlMedia.hashCode ^ background.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is HtmlWithPlatformMediumModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          html == other.html &&
          ListEquality().equals(htmlMedia, other.htmlMedia) &&
          background == other.background &&
          conditions == other.conditions;

  @override
  String toString() {
    String htmlMediaCsv = (htmlMedia == null) ? '' : htmlMedia!.join(', ');

    return 'HtmlWithPlatformMediumModel{documentID: $documentID, appId: $appId, description: $description, html: $html, htmlMedia: HtmlPlatformMedium[] { $htmlMediaCsv }, background: $background, conditions: $conditions}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (htmlMedia != null) {
      for (var item in htmlMedia!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
    }
    if (background != null) referencesCollector.addAll(await background!.collectReferences(appId: appId));
    if (conditions != null) referencesCollector.addAll(await conditions!.collectReferences(appId: appId));
    return referencesCollector;
  }

  HtmlWithPlatformMediumEntity toEntity({String? appId}) {
    return HtmlWithPlatformMediumEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          html: (html != null) ? html : null, 
          htmlMedia: (htmlMedia != null) ? htmlMedia
            !.map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          background: (background != null) ? background!.toEntity(appId: appId) : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static Future<HtmlWithPlatformMediumModel?> fromEntity(String documentID, HtmlWithPlatformMediumEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return HtmlWithPlatformMediumModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          html: entity.html, 
          htmlMedia: 
            entity.htmlMedia == null ? null : List<HtmlPlatformMediumModel>.from(await Future.wait(entity. htmlMedia
            !.map((item) {
            counter++;
              return HtmlPlatformMediumModel.fromEntity(counter.toString(), item);
            })
            .toList())), 
          background: 
            await BackgroundModel.fromEntity(entity.background), 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<HtmlWithPlatformMediumModel?> fromEntityPlus(String documentID, HtmlWithPlatformMediumEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return HtmlWithPlatformMediumModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          html: entity.html, 
          htmlMedia: 
            entity. htmlMedia == null ? null : List<HtmlPlatformMediumModel>.from(await Future.wait(entity. htmlMedia
            !.map((item) {
            counter++;
            return HtmlPlatformMediumModel.fromEntityPlus(counter.toString(), item, appId: appId);})
            .toList())), 
          background: 
            await BackgroundModel.fromEntityPlus(entity.background, appId: appId), 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

