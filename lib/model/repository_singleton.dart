/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'dart:collection';
import '../model/html_firestore.dart';
import '../model/html_repository.dart';
import '../model/html_cache.dart';


class RepositorySingleton extends AbstractRepositorySingleton {
    var _htmlRepository = HashMap<String, HtmlRepository>();

    HtmlRepository? htmlRepository(String? appId) {
      if ((appId != null) && (_htmlRepository[appId] == null)) _htmlRepository[appId] = HtmlCache(HtmlFirestore(appRepository()!.getSubCollection(appId, 'html'), appId));
      return _htmlRepository[appId];
    }

}
