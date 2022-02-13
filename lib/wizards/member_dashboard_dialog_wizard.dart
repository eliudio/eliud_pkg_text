import 'package:eliud_core/core/wizards/registry/new_app_wizard_info_with_action_specification.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/core_package.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/display_conditions_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
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
  List<MenuItemModel>? getThoseMenuItems(AppModel app) =>[
    menuItemManageAccount(app, MEMBER_DASHBOARD_DIALOG_ID),
  ];

  menuItemManageAccount(AppModel app, dialogID) => MenuItemModel(
      documentID: dialogID,
      text: 'Manage your account',
      description: 'Manage your account',
      icon: IconModel(
          codePoint: Icons.account_box.codePoint,
          fontFamily: Icons.settings.fontFamily),
      action: OpenDialog(app,
          dialogID: dialogID,
          conditions: DisplayConditionsModel(
              privilegeLevelRequired: PrivilegeLevelRequired.NoPrivilegeRequired,
              packageCondition: CorePackage.MUST_BE_LOGGED_ON)));

  @override
  List<NewAppTask>? getCreateTasks(
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
          await MemberDashboardDialogBuilder(app, MEMBER_DASHBOARD_DIALOG_ID)
              .create();
        });
        return tasks;
      }
    } else {
      throw Exception('Unexpected class for parameters: ' + parameters.toString());
    }
  }

  @override
  AppModel updateApp(NewAppWizardParameters parameters, AppModel adjustMe, ) => adjustMe;

  @override
  String? getPageID(String pageType) => null;
}
