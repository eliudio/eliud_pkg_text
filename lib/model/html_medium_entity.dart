/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_medium_entity.dart
                       
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
class HtmlMediumEntity {
  final String? mediumId;

  HtmlMediumEntity({this.mediumId, });


  List<Object?> get props => [mediumId, ];

  @override
  String toString() {
    return 'HtmlMediumEntity{mediumId: $mediumId}';
  }

  static HtmlMediumEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return HtmlMediumEntity(
      mediumId: map['mediumId'], 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (mediumId != null) theDocument["mediumId"] = mediumId;
      else theDocument["mediumId"] = null;
    return theDocument;
  }

  static HtmlMediumEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

