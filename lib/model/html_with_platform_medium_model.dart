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
import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_text/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_text/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_text/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_text/model/entity_export.dart';


import 'package:eliud_pkg_text/model/html_with_platform_medium_entity.dart';

import 'package:eliud_core/tools/random.dart';



class HtmlWithPlatformMediumModel {
  String? documentID;
  String? appId;
  String? description;
  String? html;
  List<HtmlPlatformMediumModel>? htmlMedia;
  StorageConditionsModel? conditions;

  HtmlWithPlatformMediumModel({this.documentID, this.appId, this.description, this.html, this.htmlMedia, this.conditions, })  {
    assert(documentID != null);
  }

  HtmlWithPlatformMediumModel copyWith({String? documentID, String? appId, String? description, String? html, List<HtmlPlatformMediumModel>? htmlMedia, StorageConditionsModel? conditions, }) {
    return HtmlWithPlatformMediumModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, html: html ?? this.html, htmlMedia: htmlMedia ?? this.htmlMedia, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ html.hashCode ^ htmlMedia.hashCode ^ conditions.hashCode;

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
          conditions == other.conditions;

  @override
  String toString() {
    String htmlMediaCsv = (htmlMedia == null) ? '' : htmlMedia!.join(', ');

    return 'HtmlWithPlatformMediumModel{documentID: $documentID, appId: $appId, description: $description, html: $html, htmlMedia: HtmlPlatformMedium[] { $htmlMediaCsv }, conditions: $conditions}';
  }

  HtmlWithPlatformMediumEntity toEntity({String? appId}) {
    return HtmlWithPlatformMediumEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          html: (html != null) ? html : null, 
          htmlMedia: (htmlMedia != null) ? htmlMedia
            !.map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static Future<HtmlWithPlatformMediumModel?> fromEntity(String documentID, HtmlWithPlatformMediumEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return HtmlWithPlatformMediumModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
          html: entity.html, 
          htmlMedia: 
            entity.htmlMedia == null ? null : List<HtmlPlatformMediumModel>.from(await Future.wait(entity. htmlMedia
            !.map((item) {
            counter++;
              return HtmlPlatformMediumModel.fromEntity(counter.toString(), item);
            })
            .toList())), 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<HtmlWithPlatformMediumModel?> fromEntityPlus(String documentID, HtmlWithPlatformMediumEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return HtmlWithPlatformMediumModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
          html: entity.html, 
          htmlMedia: 
            entity. htmlMedia == null ? null : List<HtmlPlatformMediumModel>.from(await Future.wait(entity. htmlMedia
            !.map((item) {
            counter++;
            return HtmlPlatformMediumModel.fromEntityPlus(counter.toString(), item, appId: appId);})
            .toList())), 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

