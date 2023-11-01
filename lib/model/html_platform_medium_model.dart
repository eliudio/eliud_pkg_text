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

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_text/model/entity_export.dart';


import 'package:eliud_pkg_text/model/html_platform_medium_entity.dart';




class HtmlPlatformMediumModel implements ModelBase {
  static const String packageName = 'eliud_pkg_text';
  static const String id = 'htmlPlatformMediums';

  String documentID;
  String? htmlReference;
  PlatformMediumModel? medium;

  HtmlPlatformMediumModel({required this.documentID, this.htmlReference, this.medium, })  {
  }

  HtmlPlatformMediumModel copyWith({String? documentID, String? htmlReference, PlatformMediumModel? medium, }) {
    return HtmlPlatformMediumModel(documentID: documentID ?? this.documentID, htmlReference: htmlReference ?? this.htmlReference, medium: medium ?? this.medium, );
  }

  @override
  int get hashCode => documentID.hashCode ^ htmlReference.hashCode ^ medium.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is HtmlPlatformMediumModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          htmlReference == other.htmlReference &&
          medium == other.medium;

  @override
  String toString() {
    return 'HtmlPlatformMediumModel{documentID: $documentID, htmlReference: $htmlReference, medium: $medium}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (medium != null) {
      referencesCollector.add(ModelReference(PlatformMediumModel.packageName, PlatformMediumModel.id, medium!));
    }
    if (medium != null) referencesCollector.addAll(await medium!.collectReferences(appId: appId));
    return referencesCollector;
  }

  HtmlPlatformMediumEntity toEntity({String? appId}) {
    return HtmlPlatformMediumEntity(
          htmlReference: (htmlReference != null) ? htmlReference : null, 
          mediumId: (medium != null) ? medium!.documentID : null, 
    );
  }

  static Future<HtmlPlatformMediumModel?> fromEntity(String documentID, HtmlPlatformMediumEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return HtmlPlatformMediumModel(
          documentID: documentID, 
          htmlReference: entity.htmlReference, 
    );
  }

  static Future<HtmlPlatformMediumModel?> fromEntityPlus(String documentID, HtmlPlatformMediumEntity? entity, { String? appId}) async {
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
    return HtmlPlatformMediumModel(
          documentID: documentID, 
          htmlReference: entity.htmlReference, 
          medium: mediumHolder, 
    );
  }

}

