import 'package:eliud_core/core/wizards/builders/page_builder.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/core/wizards/tools/documentIdentifier.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_pkg_text/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_component.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_model.dart';

class PageWithTextBuilder extends PageBuilder {
  final String title;
  final String text;

  PageWithTextBuilder(
      String uniqueId,
      this.title,
      this.text,
      String pageId,
      AppModel app,
      String memberId,
      HomeMenuModel theHomeMenu,
      AppBarModel theAppBar,
      DrawerModel leftDrawer,
      DrawerModel rightDrawer,
      )
      : super(uniqueId, pageId, app, memberId, theHomeMenu, theAppBar, leftDrawer,
            rightDrawer, );

  Future<PageModel> create() async {
    var htmlComponentId = constructDocumentId(uniqueId: uniqueId, documentId: pageId);
    await htmlWithPlatformMediumRepository(appId: app.documentID)!.add(HtmlWithPlatformMediumModel(
      documentID: htmlComponentId,
      appId: app.documentID,
      description: 'html 1',
      html: '<html><p>$text</p></html>',
      conditions: StorageConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple
      ),
    ));

    var page = PageModel(
      documentID: constructDocumentId(uniqueId: uniqueId, documentId: pageId),
      title: title,
      appId: app.documentID,
      bodyComponents: [
        BodyComponentModel(
            documentID: "1",
            componentName: AbstractHtmlWithPlatformMediumComponent.componentName,
            componentId: htmlComponentId)
      ],
      layout: PageLayout.ListView,
      appBar: theAppBar,
      homeMenu: theHomeMenu,
      drawer: leftDrawer,
      endDrawer: rightDrawer,
      conditions: StorageConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
    );
    await pageRepository(appId: app.documentID)!.add(page);
    return page;
  }
}
