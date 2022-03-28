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
import 'package:meta/meta.dart';

import 'package:eliud_pkg_text/model/html_with_platform_medium_repository.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_list_event.dart';
import 'package:eliud_pkg_text/model/html_with_platform_medium_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class HtmlWithPlatformMediumListBloc extends Bloc<HtmlWithPlatformMediumListEvent, HtmlWithPlatformMediumListState> {
  final HtmlWithPlatformMediumRepository _htmlWithPlatformMediumRepository;
  StreamSubscription? _htmlWithPlatformMediumsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int htmlWithPlatformMediumLimit;

  HtmlWithPlatformMediumListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required HtmlWithPlatformMediumRepository htmlWithPlatformMediumRepository, this.htmlWithPlatformMediumLimit = 5})
      : assert(htmlWithPlatformMediumRepository != null),
        _htmlWithPlatformMediumRepository = htmlWithPlatformMediumRepository,
        super(HtmlWithPlatformMediumListLoading());

  Stream<HtmlWithPlatformMediumListState> _mapLoadHtmlWithPlatformMediumListToState() async* {
    int amountNow =  (state is HtmlWithPlatformMediumListLoaded) ? (state as HtmlWithPlatformMediumListLoaded).values!.length : 0;
    _htmlWithPlatformMediumsListSubscription?.cancel();
    _htmlWithPlatformMediumsListSubscription = _htmlWithPlatformMediumRepository.listen(
          (list) => add(HtmlWithPlatformMediumListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * htmlWithPlatformMediumLimit : null
    );
  }

  Stream<HtmlWithPlatformMediumListState> _mapLoadHtmlWithPlatformMediumListWithDetailsToState() async* {
    int amountNow =  (state is HtmlWithPlatformMediumListLoaded) ? (state as HtmlWithPlatformMediumListLoaded).values!.length : 0;
    _htmlWithPlatformMediumsListSubscription?.cancel();
    _htmlWithPlatformMediumsListSubscription = _htmlWithPlatformMediumRepository.listenWithDetails(
            (list) => add(HtmlWithPlatformMediumListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * htmlWithPlatformMediumLimit : null
    );
  }

  Stream<HtmlWithPlatformMediumListState> _mapAddHtmlWithPlatformMediumListToState(AddHtmlWithPlatformMediumList event) async* {
    var value = event.value;
    if (value != null) 
      _htmlWithPlatformMediumRepository.add(value);
  }

  Stream<HtmlWithPlatformMediumListState> _mapUpdateHtmlWithPlatformMediumListToState(UpdateHtmlWithPlatformMediumList event) async* {
    var value = event.value;
    if (value != null) 
      _htmlWithPlatformMediumRepository.update(value);
  }

  Stream<HtmlWithPlatformMediumListState> _mapDeleteHtmlWithPlatformMediumListToState(DeleteHtmlWithPlatformMediumList event) async* {
    var value = event.value;
    if (value != null) 
      _htmlWithPlatformMediumRepository.delete(value);
  }

  Stream<HtmlWithPlatformMediumListState> _mapHtmlWithPlatformMediumListUpdatedToState(
      HtmlWithPlatformMediumListUpdated event) async* {
    yield HtmlWithPlatformMediumListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<HtmlWithPlatformMediumListState> mapEventToState(HtmlWithPlatformMediumListEvent event) async* {
    if (event is LoadHtmlWithPlatformMediumList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadHtmlWithPlatformMediumListToState();
      } else {
        yield* _mapLoadHtmlWithPlatformMediumListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadHtmlWithPlatformMediumListWithDetailsToState();
    } else if (event is HtmlWithPlatformMediumChangeQuery) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadHtmlWithPlatformMediumListToState();
      } else {
        yield* _mapLoadHtmlWithPlatformMediumListWithDetailsToState();
      }
    } else if (event is AddHtmlWithPlatformMediumList) {
      yield* _mapAddHtmlWithPlatformMediumListToState(event);
    } else if (event is UpdateHtmlWithPlatformMediumList) {
      yield* _mapUpdateHtmlWithPlatformMediumListToState(event);
    } else if (event is DeleteHtmlWithPlatformMediumList) {
      yield* _mapDeleteHtmlWithPlatformMediumListToState(event);
    } else if (event is HtmlWithPlatformMediumListUpdated) {
      yield* _mapHtmlWithPlatformMediumListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _htmlWithPlatformMediumsListSubscription?.cancel();
    return super.close();
  }
}


