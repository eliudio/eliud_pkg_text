/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_platform_medium_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_text/model/html_platform_medium_repository.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_list_event.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_list_state.dart';
import 'package:eliud_core_model/tools/query/query_tools.dart';

import 'html_platform_medium_model.dart';

typedef FilterHtmlPlatformMediumModels = List<HtmlPlatformMediumModel?>
    Function(List<HtmlPlatformMediumModel?> values);

class HtmlPlatformMediumListBloc
    extends Bloc<HtmlPlatformMediumListEvent, HtmlPlatformMediumListState> {
  final FilterHtmlPlatformMediumModels? filter;
  final HtmlPlatformMediumRepository _htmlPlatformMediumRepository;
  StreamSubscription? _htmlPlatformMediumsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int htmlPlatformMediumLimit;

  HtmlPlatformMediumListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required HtmlPlatformMediumRepository htmlPlatformMediumRepository,
      this.htmlPlatformMediumLimit = 5})
      : _htmlPlatformMediumRepository = htmlPlatformMediumRepository,
        super(HtmlPlatformMediumListLoading()) {
    on<LoadHtmlPlatformMediumList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadHtmlPlatformMediumListToState();
      } else {
        _mapLoadHtmlPlatformMediumListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadHtmlPlatformMediumListWithDetailsToState();
    });

    on<HtmlPlatformMediumChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadHtmlPlatformMediumListToState();
      } else {
        _mapLoadHtmlPlatformMediumListWithDetailsToState();
      }
    });

    on<AddHtmlPlatformMediumList>((event, emit) async {
      await _mapAddHtmlPlatformMediumListToState(event);
    });

    on<UpdateHtmlPlatformMediumList>((event, emit) async {
      await _mapUpdateHtmlPlatformMediumListToState(event);
    });

    on<DeleteHtmlPlatformMediumList>((event, emit) async {
      await _mapDeleteHtmlPlatformMediumListToState(event);
    });

    on<HtmlPlatformMediumListUpdated>((event, emit) {
      emit(_mapHtmlPlatformMediumListUpdatedToState(event));
    });
  }

  List<HtmlPlatformMediumModel?> _filter(
      List<HtmlPlatformMediumModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadHtmlPlatformMediumListToState() async {
    int amountNow = (state is HtmlPlatformMediumListLoaded)
        ? (state as HtmlPlatformMediumListLoaded).values!.length
        : 0;
    _htmlPlatformMediumsListSubscription?.cancel();
    _htmlPlatformMediumsListSubscription = _htmlPlatformMediumRepository.listen(
        (list) => add(HtmlPlatformMediumListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!)
            ? pages * htmlPlatformMediumLimit
            : null);
  }

  Future<void> _mapLoadHtmlPlatformMediumListWithDetailsToState() async {
    int amountNow = (state is HtmlPlatformMediumListLoaded)
        ? (state as HtmlPlatformMediumListLoaded).values!.length
        : 0;
    _htmlPlatformMediumsListSubscription?.cancel();
    _htmlPlatformMediumsListSubscription =
        _htmlPlatformMediumRepository.listenWithDetails(
            (list) => add(HtmlPlatformMediumListUpdated(
                value: _filter(list), mightHaveMore: amountNow != list.length)),
            orderBy: orderBy,
            descending: descending,
            eliudQuery: eliudQuery,
            limit: ((paged != null) && paged!)
                ? pages * htmlPlatformMediumLimit
                : null);
  }

  Future<void> _mapAddHtmlPlatformMediumListToState(
      AddHtmlPlatformMediumList event) async {
    var value = event.value;
    if (value != null) {
      await _htmlPlatformMediumRepository.add(value);
    }
  }

  Future<void> _mapUpdateHtmlPlatformMediumListToState(
      UpdateHtmlPlatformMediumList event) async {
    var value = event.value;
    if (value != null) {
      await _htmlPlatformMediumRepository.update(value);
    }
  }

  Future<void> _mapDeleteHtmlPlatformMediumListToState(
      DeleteHtmlPlatformMediumList event) async {
    var value = event.value;
    if (value != null) {
      await _htmlPlatformMediumRepository.delete(value);
    }
  }

  HtmlPlatformMediumListLoaded _mapHtmlPlatformMediumListUpdatedToState(
          HtmlPlatformMediumListUpdated event) =>
      HtmlPlatformMediumListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _htmlPlatformMediumsListSubscription?.cancel();
    return super.close();
  }
}
