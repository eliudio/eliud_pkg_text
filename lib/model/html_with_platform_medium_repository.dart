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

import 'package:eliud_pkg_text/model/model_export.dart';
import 'package:eliud_pkg_text/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core_model/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef HtmlWithPlatformMediumModelTrigger = Function(
    List<HtmlWithPlatformMediumModel?> list);
typedef HtmlWithPlatformMediumChanged = Function(
    HtmlWithPlatformMediumModel? value);
typedef HtmlWithPlatformMediumErrorHandler = Function(dynamic o, dynamic e);

abstract class HtmlWithPlatformMediumRepository extends RepositoryBase<
    HtmlWithPlatformMediumModel, HtmlWithPlatformMediumEntity> {
  @override
  Future<HtmlWithPlatformMediumEntity> addEntity(
      String documentID, HtmlWithPlatformMediumEntity value);
  @override
  Future<HtmlWithPlatformMediumEntity> updateEntity(
      String documentID, HtmlWithPlatformMediumEntity value);
  @override
  Future<HtmlWithPlatformMediumModel> add(HtmlWithPlatformMediumModel value);
  @override
  Future<void> delete(HtmlWithPlatformMediumModel value);
  @override
  Future<HtmlWithPlatformMediumModel?> get(String? id,
      {Function(Exception)? onError});
  @override
  Future<HtmlWithPlatformMediumModel> update(HtmlWithPlatformMediumModel value);

  @override
  Stream<List<HtmlWithPlatformMediumModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<HtmlWithPlatformMediumModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<HtmlWithPlatformMediumModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<HtmlWithPlatformMediumModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<HtmlWithPlatformMediumModel?>> listen(
      HtmlWithPlatformMediumModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<HtmlWithPlatformMediumModel?>> listenWithDetails(
      HtmlWithPlatformMediumModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<HtmlWithPlatformMediumModel?> listenTo(
      String documentId, HtmlWithPlatformMediumChanged changed,
      {HtmlWithPlatformMediumErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<HtmlWithPlatformMediumModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
