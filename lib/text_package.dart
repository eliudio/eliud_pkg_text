import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_core/wizards/member_dashboard_dialog_wizard.dart';
import 'package:eliud_pkg_text/wizards/welcome_page_wizard.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:eliud_core/model/access_model.dart';

import 'model/abstract_repository_singleton.dart';
import 'model/component_registry.dart';
import 'model/repository_singleton.dart';

abstract class TextPackage extends Package {
  TextPackage() : super('eliud_pkg_text');

  @override
  Future<List<PackageConditionDetails>>? getAndSubscribe(AccessBloc accessBloc, AppModel app, MemberModel? member, bool isOwner, bool? isBlocked, PrivilegeLevel? privilegeLevel) => null;

  @override
  List<String>? retrieveAllPackageConditions() => null;

  @override
  List<MemberCollectionInfo> getMemberCollectionInfo() => [];

  @override
  void init() {
    ComponentRegistry().init();

    // Wizard
    NewAppWizardRegistry.registry().register(WelcomePageWizard());
    NewAppWizardRegistry.registry().register(MemberDashboardDialogWizard());

    AbstractRepositorySingleton.singleton = RepositorySingleton();
  }
}
