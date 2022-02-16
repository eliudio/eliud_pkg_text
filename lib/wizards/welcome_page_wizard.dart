import 'package:eliud_core/core/wizards/registry/new_app_wizard_info_with_action_specification.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:flutter/material.dart';

import 'builders/page/welcome_page_builder.dart';

class WelcomePageWizard extends NewAppWizardInfoWithActionSpecification {
  static String WELCOME_PAGE_ID = 'welcome';

  WelcomePageWizard() : super('welcome', 'Welcome Page',  'Generate Welcome Page');

  @override
  NewAppWizardParameters newAppWizardParameters() => ActionSpecificationParametersBase(
    requiresAccessToLocalFileSystem: false,
    availableInLeftDrawer: true,
    availableInRightDrawer: false,
    availableInAppBar: false,
    availableInHomeMenu: true,
    available: false,
  );

  @override
  List<MenuItemModel>? getThoseMenuItems(AppModel app) =>[
    menuItemWelcome(app, WELCOME_PAGE_ID, 'Welcome'),
  ];

  menuItemWelcome(AppModel app, pageID, text) => MenuItemModel(
      documentID: pageID,
      text: text,
      description: text,
      icon: IconModel(
          codePoint: Icons.emoji_people.codePoint,
          fontFamily: Icons.settings.fontFamily),
      action: GotoPage(app, pageID: pageID));

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
      var welcomePageSpecifications = parameters.actionSpecifications;
      if (welcomePageSpecifications.shouldCreatePageDialogOrWorkflow()) {
        var memberId = member.documentID!;
        List<NewAppTask> tasks = [];
        tasks.add(() async {
          print("Welcome Page");
          await WelcomePageBuilder(WELCOME_PAGE_ID, app,
              memberId, homeMenuProvider(), appBarProvider(), leftDrawerProvider(), rightDrawerProvider())
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
  String? getPageID(String pageType) {
    if (pageType == 'homePageId') return WELCOME_PAGE_ID;
    return null;
  }
}
