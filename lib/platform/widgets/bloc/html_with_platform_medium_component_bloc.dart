import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_bloc.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';

import '../../../model/abstract_repository_singleton.dart';
import '../../../model/html_platform_medium_model.dart';
import '../../../model/html_with_platform_medium_entity.dart';
import '../../../model/html_with_platform_medium_model.dart';

class HtmlPlatformMediumBloc extends ExtEditorBaseBloc<HtmlWithPlatformMediumModel, HtmlPlatformMediumModel, HtmlWithPlatformMediumEntity> {

  HtmlPlatformMediumBloc(String appId)
      : super(appId, htmlWithPlatformMediumRepository(appId: appId)!, null);

  @override
  HtmlWithPlatformMediumModel addItem(HtmlWithPlatformMediumModel model, HtmlPlatformMediumModel newItem) {
    List<HtmlPlatformMediumModel> newItems = model.htmlMedia == null
        ? []
        : model.htmlMedia!.map((e) => e).toList();
    newItems.add(newItem);
    var newModel = model.copyWith(htmlMedia:  newItems);
    return newModel;
  }

  @override
  HtmlWithPlatformMediumModel deleteItem(HtmlWithPlatformMediumModel model, HtmlPlatformMediumModel deleteItem) {
    var newItems = <HtmlPlatformMediumModel>[];
    for (var item in model.htmlMedia!) {
      if (item != deleteItem) {
        newItems.add(item);
      }
    }
    var newModel = model.copyWith(htmlMedia: newItems);
    return newModel;
  }

  @override
  HtmlWithPlatformMediumModel newInstance(StorageConditionsModel conditions) {
    return HtmlWithPlatformMediumModel(
      appId: appId,
      description: 'New feed menu',
      documentID: newRandomKey(),
      conditions: conditions,
    );
  }

  @override
  HtmlWithPlatformMediumModel setDefaultValues(HtmlWithPlatformMediumModel t, StorageConditionsModel conditions) {
    return t.copyWith(
        conditions: t.conditions ?? conditions);
  }

  @override
  HtmlWithPlatformMediumModel updateItem(HtmlWithPlatformMediumModel model, HtmlPlatformMediumModel oldItem, HtmlPlatformMediumModel newItem) {
    List<HtmlPlatformMediumModel> currentItems = model.htmlMedia == null
        ? []
        : model.htmlMedia!;
    var index = currentItems.indexOf(oldItem);
    if (index != -1) {
      var newItems = currentItems.map((e) => e).toList();
      newItems[index] = newItem;
      var newModel = model.copyWith(htmlMedia: newItems);
      return newModel;
    } else {
      throw Exception("Could not find " + oldItem.toString());
    }
  }

  @override
  List<HtmlPlatformMediumModel> copyOf(List<HtmlPlatformMediumModel> ts) {
    return ts.map((e) => e).toList();
  }

}
