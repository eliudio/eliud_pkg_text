/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_platform_medium_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/core/base/entity_base.dart';

class HtmlPlatformMediumEntity implements EntityBase {
  final String? htmlReference;
  final String? mediumId;

  HtmlPlatformMediumEntity({
    this.htmlReference,
    this.mediumId,
  });

  HtmlPlatformMediumEntity copyWith({
    String? documentID,
    String? htmlReference,
    String? mediumId,
  }) {
    return HtmlPlatformMediumEntity(
      htmlReference: htmlReference ?? this.htmlReference,
      mediumId: mediumId ?? this.mediumId,
    );
  }

  List<Object?> get props => [
        htmlReference,
        mediumId,
      ];

  @override
  String toString() {
    return 'HtmlPlatformMediumEntity{htmlReference: $htmlReference, mediumId: $mediumId}';
  }

  static HtmlPlatformMediumEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var mediumIdNewDocmentId = map['mediumId'];
    if ((newDocumentIds != null) && (mediumIdNewDocmentId != null)) {
      var mediumIdOldDocmentId = mediumIdNewDocmentId;
      mediumIdNewDocmentId = newRandomKey();
      newDocumentIds[mediumIdOldDocmentId] = mediumIdNewDocmentId;
    }
    return HtmlPlatformMediumEntity(
      htmlReference: map['htmlReference'],
      mediumId: mediumIdNewDocmentId,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (htmlReference != null) {
      theDocument["htmlReference"] = htmlReference;
    } else {
      theDocument["htmlReference"] = null;
    }
    if (mediumId != null) {
      theDocument["mediumId"] = mediumId;
    } else {
      theDocument["mediumId"] = null;
    }
    return theDocument;
  }

  @override
  HtmlPlatformMediumEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static HtmlPlatformMediumEntity? fromJsonString(String json,
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
