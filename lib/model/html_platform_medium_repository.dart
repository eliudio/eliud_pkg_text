/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_platform_medium_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_text/model/model_export.dart';
import 'package:eliud_pkg_text/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core_model/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef HtmlPlatformMediumModelTrigger = Function(
    List<HtmlPlatformMediumModel?> list);
typedef HtmlPlatformMediumChanged = Function(HtmlPlatformMediumModel? value);
typedef HtmlPlatformMediumErrorHandler = Function(dynamic o, dynamic e);

abstract class HtmlPlatformMediumRepository
    extends RepositoryBase<HtmlPlatformMediumModel, HtmlPlatformMediumEntity> {
  @override
  Future<HtmlPlatformMediumEntity> addEntity(
      String documentID, HtmlPlatformMediumEntity value);
  @override
  Future<HtmlPlatformMediumEntity> updateEntity(
      String documentID, HtmlPlatformMediumEntity value);
  @override
  Future<HtmlPlatformMediumModel> add(HtmlPlatformMediumModel value);
  @override
  Future<void> delete(HtmlPlatformMediumModel value);
  @override
  Future<HtmlPlatformMediumModel?> get(String? id,
      {Function(Exception)? onError});
  @override
  Future<HtmlPlatformMediumModel> update(HtmlPlatformMediumModel value);

  @override
  Stream<List<HtmlPlatformMediumModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<HtmlPlatformMediumModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<HtmlPlatformMediumModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<HtmlPlatformMediumModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<HtmlPlatformMediumModel?>> listen(
      HtmlPlatformMediumModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<HtmlPlatformMediumModel?>> listenWithDetails(
      HtmlPlatformMediumModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<HtmlPlatformMediumModel?> listenTo(
      String documentId, HtmlPlatformMediumChanged changed,
      {HtmlPlatformMediumErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<HtmlPlatformMediumModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
