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
import 'package:eliud_core/tools/component/component_spec.dart';

import '../extensions/html_component.dart';
import '../editors/html_component_editor.dart';
import 'html_component_selector.dart';
import 'package:eliud_pkg_text/model/internal_component.dart';




class ComponentRegistry {

  void init() {
    Registry.registry()!.addInternalComponents('eliud_pkg_text', ["htmls", ]);

    Registry.registry()!.register(componentName: "eliud_pkg_text_internalWidgets", componentConstructor: ListComponentFactory());
    Registry.registry()!.addDropDownSupporter("htmls", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "htmls", componentConstructor: HtmlComponentConstructorDefault());
    Registry.registry()!.addComponentSpec('eliud_pkg_text', [
      ComponentSpec('htmls', HtmlComponentConstructorDefault(), HtmlComponentSelector(), HtmlComponentEditorConstructor(), ), 
    ]);

  }
}


