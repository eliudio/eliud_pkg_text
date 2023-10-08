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

import 'package:eliud_pkg_text/model/html_with_platform_medium_repository.dart';


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


import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef HtmlWithPlatformMediumModelTrigger(List<HtmlWithPlatformMediumModel?> list);
typedef HtmlWithPlatformMediumChanged(HtmlWithPlatformMediumModel? value);
typedef HtmlWithPlatformMediumErrorHandler(o, e);

abstract class HtmlWithPlatformMediumRepository extends RepositoryBase<HtmlWithPlatformMediumModel, HtmlWithPlatformMediumEntity> {
  Future<HtmlWithPlatformMediumEntity> addEntity(String documentID, HtmlWithPlatformMediumEntity value);
  Future<HtmlWithPlatformMediumEntity> updateEntity(String documentID, HtmlWithPlatformMediumEntity value);
  Future<HtmlWithPlatformMediumModel> add(HtmlWithPlatformMediumModel value);
  Future<void> delete(HtmlWithPlatformMediumModel value);
  Future<HtmlWithPlatformMediumModel?> get(String? id, { Function(Exception)? onError });
  Future<HtmlWithPlatformMediumModel> update(HtmlWithPlatformMediumModel value);

  Stream<List<HtmlWithPlatformMediumModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<HtmlWithPlatformMediumModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<HtmlWithPlatformMediumModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<HtmlWithPlatformMediumModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<HtmlWithPlatformMediumModel?>> listen(HtmlWithPlatformMediumModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<HtmlWithPlatformMediumModel?>> listenWithDetails(HtmlWithPlatformMediumModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<HtmlWithPlatformMediumModel?> listenTo(String documentId, HtmlWithPlatformMediumChanged changed, {HtmlWithPlatformMediumErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<HtmlWithPlatformMediumModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


