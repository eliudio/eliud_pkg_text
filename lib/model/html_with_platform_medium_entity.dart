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
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_text/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class HtmlWithPlatformMediumEntity {
  final String? appId;
  final String? name;
  final String? html;
  final List<HtmlPlatformMediumEntity>? htmlMedia;
  final StorageConditionsEntity? conditions;

  HtmlWithPlatformMediumEntity({this.appId, this.name, this.html, this.htmlMedia, this.conditions, });


  List<Object?> get props => [appId, name, html, htmlMedia, conditions, ];

  @override
  String toString() {
    String htmlMediaCsv = (htmlMedia == null) ? '' : htmlMedia!.join(', ');

    return 'HtmlWithPlatformMediumEntity{appId: $appId, name: $name, html: $html, htmlMedia: HtmlPlatformMedium[] { $htmlMediaCsv }, conditions: $conditions}';
  }

  static HtmlWithPlatformMediumEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var htmlMediaFromMap;
    htmlMediaFromMap = map['htmlMedia'];
    var htmlMediaList;
    if (htmlMediaFromMap != null)
      htmlMediaList = (map['htmlMedia'] as List<dynamic>)
        .map((dynamic item) =>
        HtmlPlatformMediumEntity.fromMap(item as Map)!)
        .toList();
    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap);

    return HtmlWithPlatformMediumEntity(
      appId: map['appId'], 
      name: map['name'], 
      html: map['html'], 
      htmlMedia: htmlMediaList, 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? htmlMediaListMap = htmlMedia != null 
        ? htmlMedia!.map((item) => item.toDocument()).toList()
        : null;
    final Map<String, dynamic>? conditionsMap = conditions != null 
        ? conditions!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (html != null) theDocument["html"] = html;
      else theDocument["html"] = null;
    if (htmlMedia != null) theDocument["htmlMedia"] = htmlMediaListMap;
      else theDocument["htmlMedia"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  static HtmlWithPlatformMediumEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

