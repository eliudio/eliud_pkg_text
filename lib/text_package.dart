import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core_main/apis/wizard_api/new_app_wizard_info.dart';
import 'package:eliud_core_main/apis/apis.dart';
import 'package:eliud_core/core_package.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_pkg_medium/medium_package.dart';
import 'package:eliud_pkg_text/editors/html_with_platform_medium_component_editor.dart';
import 'package:eliud_pkg_text/extensions/html_with_platform_medium_component.dart';
import 'package:eliud_pkg_text/wizards/welcome_page_wizard.dart';
import 'package:eliud_core_model/model/access_model.dart';

import 'package:eliud_pkg_text/text_package_stub.dart'
    if (dart.library.io) 'text_mobile_package.dart'
    if (dart.library.html) 'text_web_package.dart';
import 'package:eliud_core_main/tools/etc/member_collection_info.dart';
import 'package:eliud_pkg_text_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_text_model/model/component_registry.dart';
import 'package:eliud_pkg_text_model/model/repository_singleton.dart';

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
    ComponentRegistry().init(
      HtmlWithPlatformMediumComponentConstructorDefault(),
      HtmlWithPlatformMediumComponentEditorConstructor(),
    );

    // Wizard
    Apis.apis().getWizardApi().register(WelcomePageWizard());

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
