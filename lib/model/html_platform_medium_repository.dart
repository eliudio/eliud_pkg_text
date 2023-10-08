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

import 'package:eliud_pkg_text/model/html_platform_medium_repository.dart';


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

typedef HtmlPlatformMediumModelTrigger(List<HtmlPlatformMediumModel?> list);
typedef HtmlPlatformMediumChanged(HtmlPlatformMediumModel? value);
typedef HtmlPlatformMediumErrorHandler(o, e);

abstract class HtmlPlatformMediumRepository extends RepositoryBase<HtmlPlatformMediumModel, HtmlPlatformMediumEntity> {
  Future<HtmlPlatformMediumEntity> addEntity(String documentID, HtmlPlatformMediumEntity value);
  Future<HtmlPlatformMediumEntity> updateEntity(String documentID, HtmlPlatformMediumEntity value);
  Future<HtmlPlatformMediumModel> add(HtmlPlatformMediumModel value);
  Future<void> delete(HtmlPlatformMediumModel value);
  Future<HtmlPlatformMediumModel?> get(String? id, { Function(Exception)? onError });
  Future<HtmlPlatformMediumModel> update(HtmlPlatformMediumModel value);

  Stream<List<HtmlPlatformMediumModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<HtmlPlatformMediumModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<HtmlPlatformMediumModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<HtmlPlatformMediumModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<HtmlPlatformMediumModel?>> listen(HtmlPlatformMediumModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<HtmlPlatformMediumModel?>> listenWithDetails(HtmlPlatformMediumModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<HtmlPlatformMediumModel?> listenTo(String documentId, HtmlPlatformMediumChanged changed, {HtmlPlatformMediumErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<HtmlPlatformMediumModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


