import 'package:eliud_core_main/wizards/builders/page_builder.dart';
import 'package:eliud_core_main/wizards/tools/document_identifier.dart';
import 'package:eliud_core_main/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/app_bar_model.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/body_component_model.dart';
import 'package:eliud_core_main/model/drawer_model.dart';
import 'package:eliud_core_main/model/home_menu_model.dart';
import 'package:eliud_core_main/model/page_model.dart';
import 'package:eliud_core_main/model/storage_conditions_model.dart';
import 'package:eliud_pkg_text_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_text_model/model/html_with_platform_medium_component.dart';
import 'package:eliud_pkg_text_model/model/html_with_platform_medium_model.dart';

class PageWithTextBuilder extends PageBuilder {
  final String title;
  final String text;
  final String description;

  PageWithTextBuilder(
    String uniqueId,
    this.title,
    this.description,
    this.text,
    String pageId,
    AppModel app,
    String memberId,
    HomeMenuModel theHomeMenu,
    AppBarModel theAppBar,
    DrawerModel leftDrawer,
    DrawerModel rightDrawer,
  ) : super(
          uniqueId,
          pageId,
          app,
          memberId,
          theHomeMenu,
          theAppBar,
          leftDrawer,
          rightDrawer,
        );

  Future<PageModel> create() async {
    var htmlComponentId =
        constructDocumentId(uniqueId: uniqueId, documentId: pageId);
    await htmlWithPlatformMediumRepository(appId: app.documentID)!
        .add(HtmlWithPlatformMediumModel(
      documentID: htmlComponentId,
      appId: app.documentID,
      description: 'html 1',
      html: '<html><p>$text</p></html>',
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple),
    ));

    var page = PageModel(
      documentID: constructDocumentId(uniqueId: uniqueId, documentId: pageId),
      title: title,
      description: description,
      appId: app.documentID,
      bodyComponents: [
        BodyComponentModel(
            documentID: "1",
            componentName:
                AbstractHtmlWithPlatformMediumComponent.componentName,
            componentId: htmlComponentId)
      ],
      layout: PageLayout.listView,
      appBar: theAppBar,
      homeMenu: theHomeMenu,
      drawer: leftDrawer,
      endDrawer: rightDrawer,
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple),
    );
    await pageRepository(appId: app.documentID)!.add(page);
    return page;
  }
}
