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
  ConditionsSimpleModel? conditions;

  HtmlModel({this.documentID, this.appId, this.name, this.html, this.conditions, })  {
    assert(documentID != null);
  }

  HtmlModel copyWith({String? documentID, String? appId, String? name, String? html, ConditionsSimpleModel? conditions, }) {
    return HtmlModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, html: html ?? this.html, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ html.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is HtmlModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          html == other.html &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'HtmlModel{documentID: $documentID, appId: $appId, name: $name, html: $html, conditions: $conditions}';
  }

  HtmlEntity toEntity({String? appId}) {
    return HtmlEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          html: (html != null) ? html : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static HtmlModel? fromEntity(String documentID, HtmlEntity? entity) {
    if (entity == null) return null;
    var counter = 0;
    return HtmlModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          html: entity.html, 
          conditions: 
            ConditionsSimpleModel.fromEntity(entity.conditions), 
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
          conditions: 
            await ConditionsSimpleModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

