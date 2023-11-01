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

class HtmlWithPlatformMediumFirestore implements HtmlWithPlatformMediumRepository {
  @override
  HtmlWithPlatformMediumEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    return HtmlWithPlatformMediumEntity.fromMap(o, newDocumentIds: newDocumentIds);
  }

  Future<HtmlWithPlatformMediumEntity> addEntity(String documentID, HtmlWithPlatformMediumEntity value) {
    return HtmlWithPlatformMediumCollection.doc(documentID).set(value.toDocument()).then((_) => value);
  }

  Future<HtmlWithPlatformMediumEntity> updateEntity(String documentID, HtmlWithPlatformMediumEntity value) {
    return HtmlWithPlatformMediumCollection.doc(documentID).update(value.toDocument()).then((_) => value);
  }

  Future<HtmlWithPlatformMediumModel> add(HtmlWithPlatformMediumModel value) {
    return HtmlWithPlatformMediumCollection.doc(value.documentID).set(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(HtmlWithPlatformMediumModel value) {
    return HtmlWithPlatformMediumCollection.doc(value.documentID).delete();
  }

  Future<HtmlWithPlatformMediumModel> update(HtmlWithPlatformMediumModel value) {
    return HtmlWithPlatformMediumCollection.doc(value.documentID).update(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<HtmlWithPlatformMediumModel?> _populateDoc(DocumentSnapshot value) async {
    return HtmlWithPlatformMediumModel.fromEntity(value.id, HtmlWithPlatformMediumEntity.fromMap(value.data()));
  }

  Future<HtmlWithPlatformMediumModel?> _populateDocPlus(DocumentSnapshot value) async {
    return HtmlWithPlatformMediumModel.fromEntityPlus(value.id, HtmlWithPlatformMediumEntity.fromMap(value.data()), appId: appId);  }

  Future<HtmlWithPlatformMediumEntity?> getEntity(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = HtmlWithPlatformMediumCollection.doc(id);
      var doc = await collection.get();
      return HtmlWithPlatformMediumEntity.fromMap(doc.data());
    } on Exception catch(e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving HtmlWithPlatformMedium with id $id");
        print("Exceptoin: $e");
      }
    };
return null;
  }

  Future<HtmlWithPlatformMediumModel?> get(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = HtmlWithPlatformMediumCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch(e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving HtmlWithPlatformMedium with id $id");
        print("Exceptoin: $e");
      }
    };
return null;
  }

  StreamSubscription<List<HtmlWithPlatformMediumModel?>> listen(HtmlWithPlatformMediumModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<HtmlWithPlatformMediumModel?>> stream;
    stream = getQuery(getCollection(), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
//  see comment listen(...) above
//  stream = getQuery(HtmlWithPlatformMediumCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDoc(doc)).toList());
    });

    return stream.listen((listOfHtmlWithPlatformMediumModels) {
      trigger(listOfHtmlWithPlatformMediumModels);
    });
  }

  StreamSubscription<List<HtmlWithPlatformMediumModel?>> listenWithDetails(HtmlWithPlatformMediumModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<HtmlWithPlatformMediumModel?>> stream;
    stream = getQuery(getCollection(), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
//  see comment listen(...) above
//  stream = getQuery(HtmlWithPlatformMediumCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfHtmlWithPlatformMediumModels) {
      trigger(listOfHtmlWithPlatformMediumModels);
    });
  }

  @override
  StreamSubscription<HtmlWithPlatformMediumModel?> listenTo(String documentId, HtmlWithPlatformMediumChanged changed, {HtmlWithPlatformMediumErrorHandler? errorHandler}) {
    var stream = HtmlWithPlatformMediumCollection.doc(documentId)
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

  Stream<List<HtmlWithPlatformMediumModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<HtmlWithPlatformMediumModel?>> _values = getQuery(HtmlWithPlatformMediumCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<HtmlWithPlatformMediumModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<HtmlWithPlatformMediumModel?>> _values = getQuery(HtmlWithPlatformMediumCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<HtmlWithPlatformMediumModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<HtmlWithPlatformMediumModel?> _values = await getQuery(HtmlWithPlatformMediumCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<HtmlWithPlatformMediumModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<HtmlWithPlatformMediumModel?> _values = await getQuery(HtmlWithPlatformMediumCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  void flush() {}

  Future<void> deleteAll() {
    return HtmlWithPlatformMediumCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return HtmlWithPlatformMediumCollection.doc(documentId).collection(name);
  }

  String? timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  } 

  Future<HtmlWithPlatformMediumModel?> changeValue(String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return HtmlWithPlatformMediumCollection.doc(documentId).update({fieldName: change}).then((v) => get(documentId));
  }


  final String appId;
  HtmlWithPlatformMediumFirestore(this.getCollection, this.appId): HtmlWithPlatformMediumCollection = getCollection();

  final CollectionReference HtmlWithPlatformMediumCollection;
  final GetCollection getCollection;
}

