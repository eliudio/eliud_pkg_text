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
import 'package:meta/meta.dart';

import 'package:eliud_pkg_text/model/html_platform_medium_repository.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_list_event.dart';
import 'package:eliud_pkg_text/model/html_platform_medium_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class HtmlPlatformMediumListBloc extends Bloc<HtmlPlatformMediumListEvent, HtmlPlatformMediumListState> {
  final HtmlPlatformMediumRepository _htmlPlatformMediumRepository;
  StreamSubscription? _htmlPlatformMediumsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int htmlPlatformMediumLimit;

  HtmlPlatformMediumListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required HtmlPlatformMediumRepository htmlPlatformMediumRepository, this.htmlPlatformMediumLimit = 5})
      : assert(htmlPlatformMediumRepository != null),
        _htmlPlatformMediumRepository = htmlPlatformMediumRepository,
        super(HtmlPlatformMediumListLoading());

  Stream<HtmlPlatformMediumListState> _mapLoadHtmlPlatformMediumListToState() async* {
    int amountNow =  (state is HtmlPlatformMediumListLoaded) ? (state as HtmlPlatformMediumListLoaded).values!.length : 0;
    _htmlPlatformMediumsListSubscription?.cancel();
    _htmlPlatformMediumsListSubscription = _htmlPlatformMediumRepository.listen(
          (list) => add(HtmlPlatformMediumListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * htmlPlatformMediumLimit : null
    );
  }

  Stream<HtmlPlatformMediumListState> _mapLoadHtmlPlatformMediumListWithDetailsToState() async* {
    int amountNow =  (state is HtmlPlatformMediumListLoaded) ? (state as HtmlPlatformMediumListLoaded).values!.length : 0;
    _htmlPlatformMediumsListSubscription?.cancel();
    _htmlPlatformMediumsListSubscription = _htmlPlatformMediumRepository.listenWithDetails(
            (list) => add(HtmlPlatformMediumListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * htmlPlatformMediumLimit : null
    );
  }

  Stream<HtmlPlatformMediumListState> _mapAddHtmlPlatformMediumListToState(AddHtmlPlatformMediumList event) async* {
    var value = event.value;
    if (value != null) 
      _htmlPlatformMediumRepository.add(value);
  }

  Stream<HtmlPlatformMediumListState> _mapUpdateHtmlPlatformMediumListToState(UpdateHtmlPlatformMediumList event) async* {
    var value = event.value;
    if (value != null) 
      _htmlPlatformMediumRepository.update(value);
  }

  Stream<HtmlPlatformMediumListState> _mapDeleteHtmlPlatformMediumListToState(DeleteHtmlPlatformMediumList event) async* {
    var value = event.value;
    if (value != null) 
      _htmlPlatformMediumRepository.delete(value);
  }

  Stream<HtmlPlatformMediumListState> _mapHtmlPlatformMediumListUpdatedToState(
      HtmlPlatformMediumListUpdated event) async* {
    yield HtmlPlatformMediumListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<HtmlPlatformMediumListState> mapEventToState(HtmlPlatformMediumListEvent event) async* {
    if (event is LoadHtmlPlatformMediumList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadHtmlPlatformMediumListToState();
      } else {
        yield* _mapLoadHtmlPlatformMediumListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadHtmlPlatformMediumListWithDetailsToState();
    } else if (event is AddHtmlPlatformMediumList) {
      yield* _mapAddHtmlPlatformMediumListToState(event);
    } else if (event is UpdateHtmlPlatformMediumList) {
      yield* _mapUpdateHtmlPlatformMediumListToState(event);
    } else if (event is DeleteHtmlPlatformMediumList) {
      yield* _mapDeleteHtmlPlatformMediumListToState(event);
    } else if (event is HtmlPlatformMediumListUpdated) {
      yield* _mapHtmlPlatformMediumListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _htmlPlatformMediumsListSubscription?.cancel();
    return super.close();
  }
}


