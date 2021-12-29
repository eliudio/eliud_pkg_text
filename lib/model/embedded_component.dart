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
import 'package:eliud_core/core/blocs/access/access_bloc.dart';

import '../model/html_medium_list_bloc.dart';
import '../model/html_medium_list.dart';
import '../model/html_medium_list_event.dart';
import '../model/html_medium_model.dart';
import '../model/html_medium_repository.dart';

typedef HtmlMediumListChanged(List<HtmlMediumModel> values);

htmlMediumsList(app, context, value, trigger) => EmbeddedComponentFactory.htmlMediumsList(app, context, value, trigger);

class EmbeddedComponentFactory {

static Widget htmlMediumsList(AppModel app, BuildContext context, List<HtmlMediumModel> values, HtmlMediumListChanged trigger) {
  HtmlMediumInMemoryRepository inMemoryRepository = HtmlMediumInMemoryRepository(trigger, values,);
  return MultiBlocProvider(
    providers: [
      BlocProvider<HtmlMediumListBloc>(
        create: (context) => HtmlMediumListBloc(
          htmlMediumRepository: inMemoryRepository,
          )..add(LoadHtmlMediumList()),
        )
        ],
    child: HtmlMediumListWidget(app: app, isEmbedded: true),
  );
}


}

class HtmlMediumInMemoryRepository implements HtmlMediumRepository {
    final List<HtmlMediumModel> items;
    final HtmlMediumListChanged trigger;
    Stream<List<HtmlMediumModel>>? theValues;

    HtmlMediumInMemoryRepository(this.trigger, this.items) {
        List<List<HtmlMediumModel>> myList = <List<HtmlMediumModel>>[];
        if (items != null) myList.add(items);
        theValues = Stream<List<HtmlMediumModel>>.fromIterable(myList);
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

    Future<HtmlMediumModel> add(HtmlMediumModel value) {
        items.add(value.copyWith(documentID: newRandomKey()));
        trigger(items);
        return Future.value(value);
    }

    Future<void> delete(HtmlMediumModel value) {
      int index = _index(value.documentID!);
      if (index >= 0) items.removeAt(index);
      trigger(items);
      return Future.value(value);
    }

    Future<HtmlMediumModel> update(HtmlMediumModel value) {
      int index = _index(value.documentID!);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
      return Future.value(value);
    }

    Future<HtmlMediumModel> get(String? id, { Function(Exception)? onError }) {
      int index = _index(id!);
      var completer = new Completer<HtmlMediumModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<HtmlMediumModel>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!;
    }
    
    Stream<List<HtmlMediumModel>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!;
    }
    
    @override
    StreamSubscription<List<HtmlMediumModel>> listen(trigger, { String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<HtmlMediumModel>> listenWithDetails(trigger, { String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<HtmlMediumModel>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return Future.value(items);
    }
    
    Future<List<HtmlMediumModel>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
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
  StreamSubscription<HtmlMediumModel> listenTo(String documentId, HtmlMediumChanged changed) {
    throw UnimplementedError();
  }

  @override
  Future<HtmlMediumModel> changeValue(String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }
  

    Future<void> deleteAll() async {}
}

