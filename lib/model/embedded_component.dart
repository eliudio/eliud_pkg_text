/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/embedded_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/model/app_model.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/html_platform_medium_list_bloc.dart';
import '../model/html_platform_medium_list.dart';
import '../model/html_platform_medium_list_event.dart';
import '../model/html_platform_medium_model.dart';
import '../model/html_platform_medium_entity.dart';
import '../model/html_platform_medium_repository.dart';

typedef HtmlPlatformMediumListChanged(List<HtmlPlatformMediumModel> values);

htmlPlatformMediumsList(app, context, value, trigger) => EmbeddedComponentFactory.htmlPlatformMediumsList(app, context, value, trigger);

class EmbeddedComponentFactory {

static Widget htmlPlatformMediumsList(AppModel app, BuildContext context, List<HtmlPlatformMediumModel> values, HtmlPlatformMediumListChanged trigger) {
  HtmlPlatformMediumInMemoryRepository inMemoryRepository = HtmlPlatformMediumInMemoryRepository(trigger, values,);
  return MultiBlocProvider(
    providers: [
      BlocProvider<HtmlPlatformMediumListBloc>(
        create: (context) => HtmlPlatformMediumListBloc(
          htmlPlatformMediumRepository: inMemoryRepository,
          )..add(LoadHtmlPlatformMediumList()),
        )
        ],
    child: HtmlPlatformMediumListWidget(app: app, isEmbedded: true),
  );
}


}

class HtmlPlatformMediumInMemoryRepository implements HtmlPlatformMediumRepository {
    final List<HtmlPlatformMediumModel> items;
    final HtmlPlatformMediumListChanged trigger;
    Stream<List<HtmlPlatformMediumModel>>? theValues;

    HtmlPlatformMediumInMemoryRepository(this.trigger, this.items) {
        List<List<HtmlPlatformMediumModel>> myList = <List<HtmlPlatformMediumModel>>[];
        myList.add(items);
        theValues = Stream<List<HtmlPlatformMediumModel>>.fromIterable(myList);
    }

    int _index(String documentID) {
      int i = 0;
      for (final item in items) {
        if (item.documentID == documentID) {
          return i;
        }
        i++;
      }
      return -1;
    }

    Future<HtmlPlatformMediumEntity> addEntity(String documentID, HtmlPlatformMediumEntity value) {
      throw Exception('Not implemented'); 
    }

    Future<HtmlPlatformMediumEntity> updateEntity(String documentID, HtmlPlatformMediumEntity value) {
      throw Exception('Not implemented'); 
    }

    Future<HtmlPlatformMediumModel> add(HtmlPlatformMediumModel value) {
        items.add(value.copyWith(documentID: newRandomKey()));
        trigger(items);
        return Future.value(value);
    }

    Future<void> delete(HtmlPlatformMediumModel value) {
      int index = _index(value.documentID);
      if (index >= 0) items.removeAt(index);
      trigger(items);
      return Future.value(value);
    }

    Future<HtmlPlatformMediumModel> update(HtmlPlatformMediumModel value) {
      int index = _index(value.documentID);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
      return Future.value(value);
    }

    Future<HtmlPlatformMediumModel> get(String? id, { Function(Exception)? onError }) {
      int index = _index(id!);
      var completer = new Completer<HtmlPlatformMediumModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<HtmlPlatformMediumModel>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!;
    }
    
    Stream<List<HtmlPlatformMediumModel>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!;
    }
    
    @override
    StreamSubscription<List<HtmlPlatformMediumModel>> listen(trigger, { String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<HtmlPlatformMediumModel>> listenWithDetails(trigger, { String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<HtmlPlatformMediumModel>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return Future.value(items);
    }
    
    Future<List<HtmlPlatformMediumModel>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return Future.value(items);
    }

    @override
    getSubCollection(String documentId, String name) {
      throw UnimplementedError();
    }

  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }
  
  @override
  StreamSubscription<HtmlPlatformMediumModel> listenTo(String documentId, HtmlPlatformMediumChanged changed, {HtmlPlatformMediumErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<HtmlPlatformMediumModel> changeValue(String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }
  
  @override
  Future<HtmlPlatformMediumEntity?> getEntity(String? id, {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  HtmlPlatformMediumEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

    Future<void> deleteAll() async {}
}

