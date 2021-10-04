/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_text/model/html_repository.dart';
import 'package:eliud_pkg_text/model/html_list_event.dart';
import 'package:eliud_pkg_text/model/html_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class HtmlListBloc extends Bloc<HtmlListEvent, HtmlListState> {
  final HtmlRepository _htmlRepository;
  StreamSubscription? _htmlsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int htmlLimit;

  HtmlListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required HtmlRepository htmlRepository, this.htmlLimit = 5})
      : assert(htmlRepository != null),
        _htmlRepository = htmlRepository,
        super(HtmlListLoading());

  Stream<HtmlListState> _mapLoadHtmlListToState() async* {
    int amountNow =  (state is HtmlListLoaded) ? (state as HtmlListLoaded).values!.length : 0;
    _htmlsListSubscription?.cancel();
    _htmlsListSubscription = _htmlRepository.listen(
          (list) => add(HtmlListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * htmlLimit : null
    );
  }

  Stream<HtmlListState> _mapLoadHtmlListWithDetailsToState() async* {
    int amountNow =  (state is HtmlListLoaded) ? (state as HtmlListLoaded).values!.length : 0;
    _htmlsListSubscription?.cancel();
    _htmlsListSubscription = _htmlRepository.listenWithDetails(
            (list) => add(HtmlListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * htmlLimit : null
    );
  }

  Stream<HtmlListState> _mapAddHtmlListToState(AddHtmlList event) async* {
    var value = event.value;
    if (value != null) 
      _htmlRepository.add(value);
  }

  Stream<HtmlListState> _mapUpdateHtmlListToState(UpdateHtmlList event) async* {
    var value = event.value;
    if (value != null) 
      _htmlRepository.update(value);
  }

  Stream<HtmlListState> _mapDeleteHtmlListToState(DeleteHtmlList event) async* {
    var value = event.value;
    if (value != null) 
      _htmlRepository.delete(value);
  }

  Stream<HtmlListState> _mapHtmlListUpdatedToState(
      HtmlListUpdated event) async* {
    yield HtmlListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<HtmlListState> mapEventToState(HtmlListEvent event) async* {
    if (event is LoadHtmlList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadHtmlListToState();
      } else {
        yield* _mapLoadHtmlListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadHtmlListWithDetailsToState();
    } else if (event is AddHtmlList) {
      yield* _mapAddHtmlListToState(event);
    } else if (event is UpdateHtmlList) {
      yield* _mapUpdateHtmlListToState(event);
    } else if (event is DeleteHtmlList) {
      yield* _mapDeleteHtmlListToState(event);
    } else if (event is HtmlListUpdated) {
      yield* _mapHtmlListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _htmlsListSubscription?.cancel();
    return super.close();
  }
}


