import 'package:eliud_core/core/wizards/registry/new_app_wizard_info_with_action_specification.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/core/wizards/tools/documentIdentifier.dart';
import 'package:eliud_core/core_package.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/display_conditions_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:flutter/material.dart';

import 'builders/dialog/member_dashboard_dialog_builder.dart';

class MemberDashboardDialogWizard extends NewAppWizardInfoWithActionSpecification {
  static String MEMBER_DASHBOARD_DIALOG_ID = 'member_dashboard';

  MemberDashboardDialogWizard() : super('memberdashboard', 'Member Dashboard',  'Generate Member Dashboard Dialog');

  @override
  NewAppWizardParameters newAppWizardParameters() => ActionSpecificationParametersBase(
    requiresAccessToLocalFileSystem: false,
    availableInLeftDrawer: false,
    availableInRightDrawer: true,
    availableInAppBar: false,
    availableInHomeMenu: false,
    available: false,
  );

  @override
  List<MenuItemModel>? getThoseMenuItems(String uniqueId, AppModel app) =>[
    menuItemManageAccount(uniqueId, app, MEMBER_DASHBOARD_DIALOG_ID),
  ];

  menuItemManageAccount(String uniqueId, AppModel app, dialogID) => MenuItemModel(
      documentID: dialogID,
      text: 'Manage your account',
      description: 'Manage your account',
      icon: IconModel(
          codePoint: Icons.account_box.codePoint,
          fontFamily: Icons.settings.fontFamily),
      action: OpenDialog(app,
          dialogID: constructDocumentId(uniqueId: uniqueId, documentId: dialogID),
          conditions: DisplayConditionsModel(
              privilegeLevelRequired: PrivilegeLevelRequired.NoPrivilegeRequired,
              packageCondition: CorePackage.MUST_BE_LOGGED_ON)));

  @override
  List<NewAppTask>? getCreateTasks(
      String uniqueId,
      AppModel app,
      NewAppWizardParameters parameters,
      MemberModel member,
      HomeMenuProvider homeMenuProvider,
      AppBarProvider appBarProvider,
      DrawerProvider leftDrawerProvider,
      DrawerProvider rightDrawerProvider,
      ) {
    if (parameters is ActionSpecificationParametersBase) {
      var memberDashboardDialogSpecifications = parameters.actionSpecifications;

      if (memberDashboardDialogSpecifications
          .shouldCreatePageDialogOrWorkflow()) {
        List<NewAppTask> tasks = [];
        tasks.add(() async {
          print("member dashboard");
          await MemberDashboardDialogBuilder(uniqueId, app, MEMBER_DASHBOARD_DIALOG_ID)
              .create();
        });
        return tasks;
      }
    } else {
      throw Exception('Unexpected class for parameters: ' + parameters.toString());
    }
    return null;
  }

  @override
  AppModel updateApp(String uniqueId, NewAppWizardParameters parameters, AppModel adjustMe, ) => adjustMe;

  @override
  String? getPageID(String uniqueId, NewAppWizardParameters parameters, String pageType) => null;

  @override
  ActionModel? getAction(String uniqueId, NewAppWizardParameters parameters, AppModel app, String actionType, ) => null;

  @override
  PublicMediumModel? getPublicMediumModel(String uniqueId, NewAppWizardParameters parameters, String pageType) => null;

  @override
  String getPackageName() => "eliud_pkg_text";
}
