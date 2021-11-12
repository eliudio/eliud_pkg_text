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

import '../model/html_repository.dart';
import '../model/html_medium_repository.dart';
import 'package:eliud_core/core/blocs/access/repo/user_repository.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/package/package.dart';

HtmlRepository? htmlRepository({ String? appId }) => AbstractRepositorySingleton.singleton.htmlRepository(appId);

abstract class AbstractRepositorySingleton {
  static List<MemberCollectionInfo> collections = [
  ];
  static late AbstractRepositorySingleton singleton;

  HtmlRepository? htmlRepository(String? appId);

  void flush(String? appId) {
    htmlRepository(appId)!.flush();
  }
}
