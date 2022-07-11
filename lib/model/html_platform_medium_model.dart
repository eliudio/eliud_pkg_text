/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_platform_medium_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eliud_core/model/app_model.dart';

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


import 'package:eliud_pkg_text/model/html_platform_medium_entity.dart';

import 'package:eliud_core/tools/random.dart';



class HtmlPlatformMediumModel implements ModelBase {
  static const String packageName = 'eliud_pkg_text';
  static const String id = 'htmlPlatformMediums';

  String documentID;
  MemberMediumModel? medium;

  HtmlPlatformMediumModel({required this.documentID, this.medium, })  {
    assert(documentID != null);
  }

  HtmlPlatformMediumModel copyWith({String? documentID, MemberMediumModel? medium, }) {
    return HtmlPlatformMediumModel(documentID: documentID ?? this.documentID, medium: medium ?? this.medium, );
  }

  @override
  int get hashCode => documentID.hashCode ^ medium.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is HtmlPlatformMediumModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          medium == other.medium;

  @override
  String toString() {
    return 'HtmlPlatformMediumModel{documentID: $documentID, medium: $medium}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (medium != null) {
      referencesCollector.add(ModelReference(MemberMediumModel.packageName, MemberMediumModel.id, medium!));
    }
    if (medium != null) referencesCollector.addAll(await medium!.collectReferences(appId: appId));
    return referencesCollector;
  }

  HtmlPlatformMediumEntity toEntity({String? appId}) {
    return HtmlPlatformMediumEntity(
          mediumId: (medium != null) ? medium!.documentID : null, 
    );
  }

  static Future<HtmlPlatformMediumModel?> fromEntity(String documentID, HtmlPlatformMediumEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return HtmlPlatformMediumModel(
          documentID: documentID, 
    );
  }

  static Future<HtmlPlatformMediumModel?> fromEntityPlus(String documentID, HtmlPlatformMediumEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    MemberMediumModel? mediumHolder;
    if (entity.mediumId != null) {
      try {
          mediumHolder = await memberMediumRepository(appId: appId)!.get(entity.mediumId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise medium');
        print('Error whilst retrieving memberMedium with id ${entity.mediumId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return HtmlPlatformMediumModel(
          documentID: documentID, 
          medium: mediumHolder, 
    );
  }

}

