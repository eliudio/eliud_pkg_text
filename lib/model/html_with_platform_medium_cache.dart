/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_with_platform_medium_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_repository.dart';

import 'package:eliud_pkg_text/model/repository_export.dart';
import 'package:eliud_pkg_text/model/cache_export.dart';
import 'package:eliud_pkg_text/model/model_export.dart';
import 'package:eliud_pkg_text/model/entity_export.dart';

class HtmlWithPlatformMediumCache implements HtmlWithPlatformMediumRepository {
  final HtmlWithPlatformMediumRepository reference;
  final Map<String?, HtmlWithPlatformMediumModel?> fullCache = {};

  HtmlWithPlatformMediumCache(this.reference);

  /// Add a HtmlWithPlatformMediumModel to the repository, cached
  @override
  Future<HtmlWithPlatformMediumModel> add(HtmlWithPlatformMediumModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  /// Add a HtmlWithPlatformMediumEntity to the repository, cached
  @override
  Future<HtmlWithPlatformMediumEntity> addEntity(
      String documentID, HtmlWithPlatformMediumEntity value) {
    return reference.addEntity(documentID, value);
  }

  /// Update a HtmlWithPlatformMediumEntity in the repository, cached
  @override
  Future<HtmlWithPlatformMediumEntity> updateEntity(
      String documentID, HtmlWithPlatformMediumEntity value) {
    return reference.updateEntity(documentID, value);
  }

  /// Delete a HtmlWithPlatformMediumModel from the repository, cached
  @override
  Future<void> delete(HtmlWithPlatformMediumModel value) {
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  /// Retrieve a HtmlWithPlatformMediumModel with it's id, cached
  @override
  Future<HtmlWithPlatformMediumModel?> get(String? id,
      {Function(Exception)? onError}) async {
    var value = fullCache[id];
    if (value != null) return refreshRelations(value);
    value = await reference.get(id, onError: onError);
    fullCache[id] = value;
    return value;
  }

  /// Update a HtmlWithPlatformMediumModel
  @override
  Future<HtmlWithPlatformMediumModel> update(
      HtmlWithPlatformMediumModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  /// Retrieve list of List<HtmlWithPlatformMediumModel?>
  @override
  Stream<List<HtmlWithPlatformMediumModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return reference.values(
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        setLastDoc: setLastDoc,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  Stream<List<HtmlWithPlatformMediumModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return reference.valuesWithDetails(
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        setLastDoc: setLastDoc,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  Future<List<HtmlWithPlatformMediumModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    return await reference.valuesList(
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        setLastDoc: setLastDoc,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  Future<List<HtmlWithPlatformMediumModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    return await reference.valuesListWithDetails(
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        setLastDoc: setLastDoc,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  void flush() {
    fullCache.clear();
  }

  @override
  String? timeStampToString(dynamic timeStamp) {
    return reference.timeStampToString(timeStamp);
  }

  @override
  dynamic getSubCollection(String documentId, String name) {
    return reference.getSubCollection(documentId, name);
  }

  @override
  Future<HtmlWithPlatformMediumModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    return reference
        .changeValue(documentId, fieldName, changeByThisValue)
        .then((newValue) {
      fullCache[documentId] = newValue;
      return newValue!;
    });
  }

  @override
  Future<HtmlWithPlatformMediumEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    return reference.getEntity(id, onError: onError);
  }

  @override
  HtmlWithPlatformMediumEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    return reference.fromMap(o, newDocumentIds: newDocumentIds);
  }

  @override
  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<HtmlWithPlatformMediumModel?>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return reference.listen(trigger,
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<List<HtmlWithPlatformMediumModel?>> listenWithDetails(
      trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return reference.listenWithDetails(trigger,
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<HtmlWithPlatformMediumModel?> listenTo(
      String documentId, HtmlWithPlatformMediumChanged changed,
      {HtmlWithPlatformMediumErrorHandler? errorHandler}) {
    return reference.listenTo(documentId, ((value) {
      if (value != null) {
        fullCache[value.documentID] = value;
      }
      changed(value);
    }), errorHandler: errorHandler);
  }

  static Future<HtmlWithPlatformMediumModel> refreshRelations(
      HtmlWithPlatformMediumModel model) async {
    List<HtmlPlatformMediumModel>? htmlMediaHolder;
    if (model.htmlMedia != null) {
      htmlMediaHolder = List<HtmlPlatformMediumModel>.from(
              await Future.wait(model.htmlMedia!.map((element) async {
        return await HtmlPlatformMediumCache.refreshRelations(element);
      })))
          .toList();
    }

    return model.copyWith(
      htmlMedia: htmlMediaHolder,
    );
  }
}
