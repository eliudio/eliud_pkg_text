/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_with_platform_medium_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_text/model/html_with_platform_medium_repository.dart';

import 'package:eliud_pkg_text/model/repository_export.dart';
import 'package:eliud_pkg_text/model/model_export.dart';
import 'package:eliud_pkg_text/model/entity_export.dart';

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

/* 
 * HtmlWithPlatformMediumFirestore is the firestore implementation of HtmlWithPlatformMediumRepository
 */
class HtmlWithPlatformMediumFirestore
    implements HtmlWithPlatformMediumRepository {
  /* 
   * transform a map into an entity
   */
  @override
  HtmlWithPlatformMediumEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    return HtmlWithPlatformMediumEntity.fromMap(o,
        newDocumentIds: newDocumentIds);
  }

  /* 
   * add an entity to the repository
   */
  @override
  Future<HtmlWithPlatformMediumEntity> addEntity(
      String documentID, HtmlWithPlatformMediumEntity value) {
    return htmlWithPlatformMediumCollection
        .doc(documentID)
        .set(value.toDocument())
        .then((_) => value);
  }

  /* 
   * Update an entity
   */
  @override
  Future<HtmlWithPlatformMediumEntity> updateEntity(
      String documentID, HtmlWithPlatformMediumEntity value) {
    return htmlWithPlatformMediumCollection
        .doc(documentID)
        .update(value.toDocument())
        .then((_) => value);
  }

  /* 
   * Add a model to the repository
   */
  @override
  Future<HtmlWithPlatformMediumModel> add(HtmlWithPlatformMediumModel value) {
    return htmlWithPlatformMediumCollection
        .doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  /* 
   * Delete a model
   */
  @override
  Future<void> delete(HtmlWithPlatformMediumModel value) {
    return htmlWithPlatformMediumCollection.doc(value.documentID).delete();
  }

  /* 
   * Update a model
   */
  @override
  Future<HtmlWithPlatformMediumModel> update(
      HtmlWithPlatformMediumModel value) {
    return htmlWithPlatformMediumCollection
        .doc(value.documentID)
        .update(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<HtmlWithPlatformMediumModel?> _populateDoc(
      DocumentSnapshot value) async {
    return HtmlWithPlatformMediumModel.fromEntity(
        value.id, HtmlWithPlatformMediumEntity.fromMap(value.data()));
  }

  Future<HtmlWithPlatformMediumModel?> _populateDocPlus(
      DocumentSnapshot value) async {
    return HtmlWithPlatformMediumModel.fromEntityPlus(
        value.id, HtmlWithPlatformMediumEntity.fromMap(value.data()),
        appId: appId);
  }

  /* 
   * Retrieve an entity from the repository with id
   */
  @override
  Future<HtmlWithPlatformMediumEntity?> getEntity(String? id,
      {Function(Exception)? onError}) async {
    try {
      var collection = htmlWithPlatformMediumCollection.doc(id);
      var doc = await collection.get();
      return HtmlWithPlatformMediumEntity.fromMap(doc.data());
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving HtmlWithPlatformMedium with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  /* 
   * Retrieve an model from the repository with id
   */
  @override
  Future<HtmlWithPlatformMediumModel?> get(String? id,
      {Function(Exception)? onError}) async {
    try {
      var collection = htmlWithPlatformMediumCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving HtmlWithPlatformMedium with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  /* 
   * Listen to the repository using a query. Retrieve models
   */
  @override
  StreamSubscription<List<HtmlWithPlatformMediumModel?>> listen(
      HtmlWithPlatformMediumModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    Stream<List<HtmlWithPlatformMediumModel?>> stream;
    stream = getQuery(getCollection(),
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .snapshots()
//  see comment listen(...) above
//  stream = getQuery(htmlWithPlatformMediumCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDoc(doc)).toList());
    });

    return stream.listen((listOfHtmlWithPlatformMediumModels) {
      trigger(listOfHtmlWithPlatformMediumModels);
    });
  }

  /* 
   * Listen to the repository using a query. Retrieve models and linked models
   */
  @override
  StreamSubscription<List<HtmlWithPlatformMediumModel?>> listenWithDetails(
      HtmlWithPlatformMediumModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    Stream<List<HtmlWithPlatformMediumModel?>> stream;
    stream = getQuery(getCollection(),
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .snapshots()
//  see comment listen(...) above
//  stream = getQuery(htmlWithPlatformMediumCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfHtmlWithPlatformMediumModels) {
      trigger(listOfHtmlWithPlatformMediumModels);
    });
  }

  /* 
   * Listen to 1 document in the repository
   */
  @override
  StreamSubscription<HtmlWithPlatformMediumModel?> listenTo(
      String documentId, HtmlWithPlatformMediumChanged changed,
      {HtmlWithPlatformMediumErrorHandler? errorHandler}) {
    var stream = htmlWithPlatformMediumCollection
        .doc(documentId)
        .snapshots()
        .asyncMap((data) {
      return _populateDocPlus(data);
    });
    var theStream = stream.listen((value) {
      changed(value);
    });
    theStream.onError((theException, theStacktrace) {
      if (errorHandler != null) {
        errorHandler(theException, theStacktrace);
      }
    });
    return theStream;
  }

  /* 
   * Retrieve values/models from the repository
   */
  @override
  Stream<List<HtmlWithPlatformMediumModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    DocumentSnapshot? lastDoc;
    Stream<List<HtmlWithPlatformMediumModel?>> values = getQuery(
            htmlWithPlatformMediumCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .snapshots()
        .asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  /* 
   * Retrieve values/models, including linked models, from the repository
   */
  @override
  Stream<List<HtmlWithPlatformMediumModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    DocumentSnapshot? lastDoc;
    Stream<List<HtmlWithPlatformMediumModel?>> values = getQuery(
            htmlWithPlatformMediumCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .snapshots()
        .asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  /* 
   * Retrieve values/models from the repository
   */
  @override
  Future<List<HtmlWithPlatformMediumModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    DocumentSnapshot? lastDoc;
    List<HtmlWithPlatformMediumModel?> values = await getQuery(
            htmlWithPlatformMediumCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .get()
        .then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  /* 
   * Retrieve values/models, including linked models, from the repository
   */
  @override
  Future<List<HtmlWithPlatformMediumModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    DocumentSnapshot? lastDoc;
    List<HtmlWithPlatformMediumModel?> values = await getQuery(
            htmlWithPlatformMediumCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .get()
        .then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  /* 
   * Flush the repository
   */
  @override
  void flush() {}

  /* 
   * Delete all entries in the repository
   */
  @override
  Future<void> deleteAll() {
    return htmlWithPlatformMediumCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  /* 
   * Retrieve the subcollection of this repository
   */
  @override
  dynamic getSubCollection(String documentId, String name) {
    return htmlWithPlatformMediumCollection.doc(documentId).collection(name);
  }

  /* 
   * Retrieve a timestamp
   */
  @override
  String? timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  }

  /* 
   * change 1 a fieldvalue for 1 document  
   */
  @override
  Future<HtmlWithPlatformMediumModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return htmlWithPlatformMediumCollection
        .doc(documentId)
        .update({fieldName: change}).then((v) => get(documentId));
  }

  final String appId;
  HtmlWithPlatformMediumFirestore(this.getCollection, this.appId)
      : htmlWithPlatformMediumCollection = getCollection();

  final CollectionReference htmlWithPlatformMediumCollection;
  final GetCollection getCollection;
}
