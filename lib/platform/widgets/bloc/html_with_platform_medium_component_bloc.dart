import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_bloc.dart';
import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_event.dart';
import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_state.dart';
import 'package:eliud_core_model/model/storage_conditions_model.dart';

import '../../../model/abstract_repository_singleton.dart';
import '../../../model/html_platform_medium_model.dart';
import '../../../model/html_with_platform_medium_entity.dart';
import '../../../model/html_with_platform_medium_model.dart';

class HtmlMediaMoveEvent<T, U> extends ExtEditorBaseEvent<T> {
  final bool isUp;
  final U item;

  HtmlMediaMoveEvent({required this.isUp, required this.item});

  @override
  List<Object?> get props => [isUp, item];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoveEvent && isUp == other.isUp && item == other.item;

  @override
  int get hashCode => isUp.hashCode ^ item.hashCode;
}

class HtmlPlatformMediumBloc extends ExtEditorBaseBloc<
    HtmlWithPlatformMediumModel,
    HtmlPlatformMediumModel,
    HtmlWithPlatformMediumEntity> {
  HtmlPlatformMediumBloc(String appId)
      : super(appId, htmlWithPlatformMediumRepository(appId: appId)!, null) {
    on<
        HtmlMediaMoveEvent<HtmlWithPlatformMediumModel,
            HtmlPlatformMediumModel>>((event, emit) async {
      var theState = state as ExtEditorBaseInitialised;
      var items = theState.model.htmlMedia!;
      var newListedItems = copyOf(items);
      var index = items.indexOf(event.item);
      if (index != -1) {
        if (event.isUp) {
          if (index > 0) {
            var old = newListedItems[index - 1];
            newListedItems[index - 1] = newListedItems[index];
            newListedItems[index] = old;
            emit(ExtEditorBaseInitialised(
                model: theState.model.copyWith(htmlMedia: newListedItems),
                currentEdit: theState.currentEdit));
          }
        } else {
          if (index < newListedItems.length - 1) {
            var old = newListedItems[index + 1];
            newListedItems[index + 1] = newListedItems[index];
            newListedItems[index] = old;
            emit(ExtEditorBaseInitialised(
                model: theState.model.copyWith(htmlMedia: newListedItems),
                currentEdit: theState.currentEdit));
          }
        }
      }
    });
  }

  @override
  HtmlWithPlatformMediumModel addItem(
      HtmlWithPlatformMediumModel model, HtmlPlatformMediumModel newItem) {
    List<HtmlPlatformMediumModel> newItems =
        model.htmlMedia == null ? [] : model.htmlMedia!.map((e) => e).toList();
    newItems.add(newItem);
    var newModel = model.copyWith(htmlMedia: newItems);
    return newModel;
  }

  @override
  HtmlWithPlatformMediumModel deleteItem(
      HtmlWithPlatformMediumModel model, HtmlPlatformMediumModel deleteItem) {
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
    throw Exception("Not implemented");
  }

  @override
  HtmlWithPlatformMediumModel setDefaultValues(
      HtmlWithPlatformMediumModel t, StorageConditionsModel conditions) {
    throw Exception("Not implemented");
  }

  @override
  HtmlWithPlatformMediumModel updateItem(HtmlWithPlatformMediumModel model,
      HtmlPlatformMediumModel oldItem, HtmlPlatformMediumModel newItem) {
    throw Exception("Not implemented");
  }

  @override
  List<HtmlPlatformMediumModel> copyOf(List<HtmlPlatformMediumModel> ts) {
    return ts.map((e) => e).toList();
  }
}
