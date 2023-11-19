import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/core_package.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_pkg_medium/medium_package.dart';
import 'package:eliud_pkg_text/wizards/welcome_page_wizard.dart';
import 'package:eliud_core/model/access_model.dart';

import 'model/abstract_repository_singleton.dart';
import 'model/component_registry.dart';
import 'model/repository_singleton.dart';

import 'package:eliud_pkg_text/text_package_stub.dart'
    if (dart.library.io) 'text_mobile_package.dart'
    if (dart.library.html) 'text_web_package.dart';

abstract class TextPackage extends Package {
  TextPackage() : super('eliud_pkg_text');

  @override
  Future<List<PackageConditionDetails>>? getAndSubscribe(
          AccessBloc accessBloc,
          AppModel app,
          MemberModel? member,
          bool isOwner,
          bool? isBlocked,
          PrivilegeLevel? privilegeLevel) =>
      null;

  @override
  List<String>? retrieveAllPackageConditions() => null;

  @override
  List<MemberCollectionInfo> getMemberCollectionInfo() => [];

  @override
  void init() {
    ComponentRegistry().init();

    // Wizard
    NewAppWizardRegistry.registry().register(WelcomePageWizard());

    AbstractRepositorySingleton.singleton = RepositorySingleton();
  }

  static TextPackage instance() => getTextPackage();

  /*
   * Register depending packages
   */
  @override
  void registerDependencies(Eliud eliud) {
    eliud.registerPackage(CorePackage.instance());
    eliud.registerPackage(MediumPackage.instance());
  }
}
