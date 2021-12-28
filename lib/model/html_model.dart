/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_model.dart
                       
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


import 'package:eliud_pkg_text/model/html_entity.dart';

import 'package:eliud_core/tools/random.dart';



class HtmlModel {
  String? documentID;
  String? appId;
  String? name;
  String? html;
  List<HtmlMediumModel>? htmlMedia;
  StorageConditionsModel? conditions;

  HtmlModel({this.documentID, this.appId, this.name, this.html, this.htmlMedia, this.conditions, })  {
    assert(documentID != null);
  }

  HtmlModel copyWith({String? documentID, String? appId, String? name, String? html, List<HtmlMediumModel>? htmlMedia, StorageConditionsModel? conditions, }) {
    return HtmlModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, html: html ?? this.html, htmlMedia: htmlMedia ?? this.htmlMedia, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ html.hashCode ^ htmlMedia.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is HtmlModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          html == other.html &&
          ListEquality().equals(htmlMedia, other.htmlMedia) &&
          conditions == other.conditions;

  @override
  String toString() {
    String htmlMediaCsv = (htmlMedia == null) ? '' : htmlMedia!.join(', ');

    return 'HtmlModel{documentID: $documentID, appId: $appId, name: $name, html: $html, htmlMedia: HtmlMedium[] { $htmlMediaCsv }, conditions: $conditions}';
  }

  HtmlEntity toEntity({String? appId}) {
    return HtmlEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          html: (html != null) ? html : null, 
          htmlMedia: (htmlMedia != null) ? htmlMedia
            !.map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static Future<HtmlModel?> fromEntity(String documentID, HtmlEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return HtmlModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          html: entity.html, 
          htmlMedia: 
            entity.htmlMedia == null ? null : List<HtmlMediumModel>.from(await Future.wait(entity. htmlMedia
            !.map((item) {
            counter++;
              return HtmlMediumModel.fromEntity(counter.toString(), item);
            })
            .toList())), 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<HtmlModel?> fromEntityPlus(String documentID, HtmlEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return HtmlModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          html: entity.html, 
          htmlMedia: 
            entity. htmlMedia == null ? null : List<HtmlMediumModel>.from(await Future.wait(entity. htmlMedia
            !.map((item) {
            counter++;
            return HtmlMediumModel.fromEntityPlus(counter.toString(), item, appId: appId);})
            .toList())), 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

