/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/component_registry.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/internal_component.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core_model/tools/component/component_spec.dart';
import 'abstract_repository_singleton.dart';

import '../extensions/html_with_platform_medium_component.dart';
import '../editors/html_with_platform_medium_component_editor.dart';
import 'html_with_platform_medium_component_selector.dart';

/* 
 * Component registry contains a list of components
 */
class ComponentRegistry {
  /* 
   * Initialise the component registry
   */
  void init() {
    Apis.apis().addInternalComponents('eliud_pkg_text', [
      "htmlWithPlatformMediums",
    ]);

    Apis.apis().register(
        componentName: "eliud_pkg_text_internalWidgets",
        componentConstructor: ListComponentFactory());
    Apis.apis().addDropDownSupporter(
        "htmlWithPlatformMediums", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "htmlWithPlatformMediums",
        componentConstructor:
            HtmlWithPlatformMediumComponentConstructorDefault());
    Apis.apis().addComponentSpec('eliud_pkg_text', 'text', [
      ComponentSpec(
          'htmlWithPlatformMediums',
          HtmlWithPlatformMediumComponentConstructorDefault(),
          HtmlWithPlatformMediumComponentSelector(),
          HtmlWithPlatformMediumComponentEditorConstructor(),
          ({String? appId}) => htmlWithPlatformMediumRepository(appId: appId)!),
    ]);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_text',
        'htmlWithPlatformMediums',
        ({String? appId}) => htmlWithPlatformMediumRepository(appId: appId)!);
  }
}
