/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/abstract_repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/html_with_platform_medium_repository.dart';
import 'package:eliud_core/package/package.dart';

HtmlWithPlatformMediumRepository? htmlWithPlatformMediumRepository(
        {String? appId}) =>
    AbstractRepositorySingleton.singleton
        .htmlWithPlatformMediumRepository(appId);

abstract class AbstractRepositorySingleton {
  static List<MemberCollectionInfo> collections = [];
  static late AbstractRepositorySingleton singleton;

  HtmlWithPlatformMediumRepository? htmlWithPlatformMediumRepository(
      String? appId);

  void flush(String? appId) {
    htmlWithPlatformMediumRepository(appId)!.flush();
  }
}
