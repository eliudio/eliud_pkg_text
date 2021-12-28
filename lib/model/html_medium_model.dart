/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_medium_model.dart
                       
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


import 'package:eliud_pkg_text/model/html_medium_entity.dart';

import 'package:eliud_core/tools/random.dart';



class HtmlMediumModel {
  String? documentID;
  PlatformMediumModel? medium;

  HtmlMediumModel({this.documentID, this.medium, })  {
    assert(documentID != null);
  }

  HtmlMediumModel copyWith({String? documentID, PlatformMediumModel? medium, }) {
    return HtmlMediumModel(documentID: documentID ?? this.documentID, medium: medium ?? this.medium, );
  }

  @override
  int get hashCode => documentID.hashCode ^ medium.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is HtmlMediumModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          medium == other.medium;

  @override
  String toString() {
    return 'HtmlMediumModel{documentID: $documentID, medium: $medium}';
  }

  HtmlMediumEntity toEntity({String? appId}) {
    return HtmlMediumEntity(
          mediumId: (medium != null) ? medium!.documentID : null, 
    );
  }

  static Future<HtmlMediumModel?> fromEntity(String documentID, HtmlMediumEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return HtmlMediumModel(
          documentID: documentID, 
    );
  }

  static Future<HtmlMediumModel?> fromEntityPlus(String documentID, HtmlMediumEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    PlatformMediumModel? mediumHolder;
    if (entity.mediumId != null) {
      try {
          mediumHolder = await platformMediumRepository(appId: appId)!.get(entity.mediumId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise medium');
        print('Error whilst retrieving platformMedium with id ${entity.mediumId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return HtmlMediumModel(
          documentID: documentID, 
          medium: mediumHolder, 
    );
  }

}

