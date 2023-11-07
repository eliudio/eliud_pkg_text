/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_with_platform_medium_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_text/model/html_with_platform_medium_repository.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_list_event.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'html_with_platform_medium_model.dart';

typedef FilterHtmlWithPlatformMediumModels = List<HtmlWithPlatformMediumModel?>
    Function(List<HtmlWithPlatformMediumModel?> values);

class HtmlWithPlatformMediumListBloc extends Bloc<
    HtmlWithPlatformMediumListEvent, HtmlWithPlatformMediumListState> {
  final FilterHtmlWithPlatformMediumModels? filter;
  final HtmlWithPlatformMediumRepository _htmlWithPlatformMediumRepository;
  StreamSubscription? _htmlWithPlatformMediumsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int htmlWithPlatformMediumLimit;

  HtmlWithPlatformMediumListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required HtmlWithPlatformMediumRepository
          htmlWithPlatformMediumRepository,
      this.htmlWithPlatformMediumLimit = 5})
      : _htmlWithPlatformMediumRepository = htmlWithPlatformMediumRepository,
        super(HtmlWithPlatformMediumListLoading()) {
    on<LoadHtmlWithPlatformMediumList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadHtmlWithPlatformMediumListToState();
      } else {
        _mapLoadHtmlWithPlatformMediumListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadHtmlWithPlatformMediumListWithDetailsToState();
    });

    on<HtmlWithPlatformMediumChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadHtmlWithPlatformMediumListToState();
      } else {
        _mapLoadHtmlWithPlatformMediumListWithDetailsToState();
      }
    });

    on<AddHtmlWithPlatformMediumList>((event, emit) async {
      await _mapAddHtmlWithPlatformMediumListToState(event);
    });

    on<UpdateHtmlWithPlatformMediumList>((event, emit) async {
      await _mapUpdateHtmlWithPlatformMediumListToState(event);
    });

    on<DeleteHtmlWithPlatformMediumList>((event, emit) async {
      await _mapDeleteHtmlWithPlatformMediumListToState(event);
    });

    on<HtmlWithPlatformMediumListUpdated>((event, emit) {
      emit(_mapHtmlWithPlatformMediumListUpdatedToState(event));
    });
  }

  List<HtmlWithPlatformMediumModel?> _filter(
      List<HtmlWithPlatformMediumModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadHtmlWithPlatformMediumListToState() async {
    int amountNow = (state is HtmlWithPlatformMediumListLoaded)
        ? (state as HtmlWithPlatformMediumListLoaded).values!.length
        : 0;
    _htmlWithPlatformMediumsListSubscription?.cancel();
    _htmlWithPlatformMediumsListSubscription =
        _htmlWithPlatformMediumRepository.listen(
            (list) => add(HtmlWithPlatformMediumListUpdated(
                value: _filter(list), mightHaveMore: amountNow != list.length)),
            orderBy: orderBy,
            descending: descending,
            eliudQuery: eliudQuery,
            limit: ((paged != null) && paged!)
                ? pages * htmlWithPlatformMediumLimit
                : null);
  }

  Future<void> _mapLoadHtmlWithPlatformMediumListWithDetailsToState() async {
    int amountNow = (state is HtmlWithPlatformMediumListLoaded)
        ? (state as HtmlWithPlatformMediumListLoaded).values!.length
        : 0;
    _htmlWithPlatformMediumsListSubscription?.cancel();
    _htmlWithPlatformMediumsListSubscription =
        _htmlWithPlatformMediumRepository.listenWithDetails(
            (list) => add(HtmlWithPlatformMediumListUpdated(
                value: _filter(list), mightHaveMore: amountNow != list.length)),
            orderBy: orderBy,
            descending: descending,
            eliudQuery: eliudQuery,
            limit: ((paged != null) && paged!)
                ? pages * htmlWithPlatformMediumLimit
                : null);
  }

  Future<void> _mapAddHtmlWithPlatformMediumListToState(
      AddHtmlWithPlatformMediumList event) async {
    var value = event.value;
    if (value != null) {
      await _htmlWithPlatformMediumRepository.add(value);
    }
  }

  Future<void> _mapUpdateHtmlWithPlatformMediumListToState(
      UpdateHtmlWithPlatformMediumList event) async {
    var value = event.value;
    if (value != null) {
      await _htmlWithPlatformMediumRepository.update(value);
    }
  }

  Future<void> _mapDeleteHtmlWithPlatformMediumListToState(
      DeleteHtmlWithPlatformMediumList event) async {
    var value = event.value;
    if (value != null) {
      await _htmlWithPlatformMediumRepository.delete(value);
    }
  }

  HtmlWithPlatformMediumListLoaded _mapHtmlWithPlatformMediumListUpdatedToState(
          HtmlWithPlatformMediumListUpdated event) =>
      HtmlWithPlatformMediumListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _htmlWithPlatformMediumsListSubscription?.cancel();
    return super.close();
  }
}
