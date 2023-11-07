/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_with_platform_medium_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_pkg_text/model/entity_export.dart';

class HtmlWithPlatformMediumEntity implements EntityBase {
  final String? appId;
  final String? description;
  final String? html;
  final List<HtmlPlatformMediumEntity>? htmlMedia;
  final BackgroundEntity? background;
  final StorageConditionsEntity? conditions;

  HtmlWithPlatformMediumEntity({
    required this.appId,
    this.description,
    this.html,
    this.htmlMedia,
    this.background,
    this.conditions,
  });

  HtmlWithPlatformMediumEntity copyWith({
    String? documentID,
    String? appId,
    String? description,
    String? html,
    List<HtmlPlatformMediumEntity>? htmlMedia,
    BackgroundEntity? background,
    StorageConditionsEntity? conditions,
  }) {
    return HtmlWithPlatformMediumEntity(
      appId: appId ?? this.appId,
      description: description ?? this.description,
      html: html ?? this.html,
      htmlMedia: htmlMedia ?? this.htmlMedia,
      background: background ?? this.background,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        description,
        html,
        htmlMedia,
        background,
        conditions,
      ];

  @override
  String toString() {
    String htmlMediaCsv = (htmlMedia == null) ? '' : htmlMedia!.join(', ');

    return 'HtmlWithPlatformMediumEntity{appId: $appId, description: $description, html: $html, htmlMedia: HtmlPlatformMedium[] { $htmlMediaCsv }, background: $background, conditions: $conditions}';
  }

  static HtmlWithPlatformMediumEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var htmlMediaFromMap = map['htmlMedia'];
    List<HtmlPlatformMediumEntity> htmlMediaList;
    if (htmlMediaFromMap != null) {
      htmlMediaList = (map['htmlMedia'] as List<dynamic>)
          .map((dynamic item) => HtmlPlatformMediumEntity.fromMap(item as Map,
              newDocumentIds: newDocumentIds)!)
          .toList();
    } else {
      htmlMediaList = [];
    }
    var backgroundFromMap = map['background'];
    if (backgroundFromMap != null) {
      backgroundFromMap = BackgroundEntity.fromMap(backgroundFromMap,
          newDocumentIds: newDocumentIds);
    }
    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return HtmlWithPlatformMediumEntity(
      appId: map['appId'],
      description: map['description'],
      html: map['html'],
      htmlMedia: htmlMediaList,
      background: backgroundFromMap,
      conditions: conditionsFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? htmlMediaListMap = htmlMedia != null
        ? htmlMedia!.map((item) => item.toDocument()).toList()
        : null;
    final Map<String, dynamic>? backgroundMap =
        background != null ? background!.toDocument() : null;
    final Map<String, dynamic>? conditionsMap =
        conditions != null ? conditions!.toDocument() : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    if (description != null) {
      theDocument["description"] = description;
    } else {
      theDocument["description"] = null;
    }
    if (html != null) {
      theDocument["html"] = html;
    } else {
      theDocument["html"] = null;
    }
    if (htmlMedia != null) {
      theDocument["htmlMedia"] = htmlMediaListMap;
    } else {
      theDocument["htmlMedia"] = null;
    }
    if (background != null) {
      theDocument["background"] = backgroundMap;
    } else {
      theDocument["background"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    return theDocument;
  }

  @override
  HtmlWithPlatformMediumEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static HtmlWithPlatformMediumEntity? fromJsonString(String json,
      {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  @override
  Future<Map<String, Object?>> enrichedDocument(
      Map<String, Object?> theDocument) async {
    return theDocument;
  }
}
