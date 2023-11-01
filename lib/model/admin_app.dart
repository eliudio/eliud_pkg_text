/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/admin_app.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/tools/admin_app_base.dart';
import '../tools/bespoke_models.dart';


import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';

class AdminApp extends AdminAppInstallerBase {
  final String appId;
  final DrawerModel _drawer;
  final DrawerModel _endDrawer;
  final AppBarModel _appBar;
  final HomeMenuModel _homeMenu;
  final RgbModel menuItemColor;
  final RgbModel selectedMenuItemColor;
  final RgbModel backgroundColor;
  
  AdminApp(this.appId, this._drawer, this._endDrawer, this._appBar, this._homeMenu, this.menuItemColor, this.selectedMenuItemColor, this.backgroundColor);


  PageModel _htmlWithPlatformMediumsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-htmlWithPlatformMediums", componentName: "eliud_pkg_text_internalWidgets", componentId: "htmlWithPlatformMediums"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequiredSimple.OwnerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_text_htmlwithplatformmediums_page",
        title: "HtmlWithPlatformMediums",
        description: "HtmlWithPlatformMediums",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  Future<void> _setupAdminPages() {

    return pageRepository(appId: appId)!.add(_htmlWithPlatformMediumsPages())

    ;
  }

  @override
  Future<void> run() async {
    return _setupAdminPages();
  }


}

class AdminMenu extends AdminAppMenuInstallerBase {

  Future<MenuDefModel> menu(AppModel app) async {
    var menuItems = <MenuItemModel>[];

    menuItems.add(
      MenuItemModel(
        documentID: "HtmlWithPlatformMediums",
        text: "HtmlWithPlatformMediums",
        description: "HtmlWithPlatformMediums",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_pkg_text_htmlwithplatformmediums_page"))
    );


    MenuDefModel menu = MenuDefModel(
      admin: true,
      documentID: "eliud_pkg_text_admin_menu",
      appId: app.documentID,
      name: "eliud_pkg_text",
      menuItems: menuItems
    );
    await menuDefRepository(appId: app.documentID)!.add(menu);
    return menu;
  }
}

class AdminAppWiper extends AdminAppWiperBase {

  @override
  Future<void> deleteAll(String appId) async {
    ;
  }


}

