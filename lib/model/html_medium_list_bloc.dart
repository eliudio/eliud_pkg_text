/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_medium_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_text/model/html_medium_repository.dart';
import 'package:eliud_pkg_text/model/html_medium_list_event.dart';
import 'package:eliud_pkg_text/model/html_medium_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class HtmlMediumListBloc extends Bloc<HtmlMediumListEvent, HtmlMediumListState> {
  final HtmlMediumRepository _htmlMediumRepository;
  StreamSubscription? _htmlMediumsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int htmlMediumLimit;

  HtmlMediumListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required HtmlMediumRepository htmlMediumRepository, this.htmlMediumLimit = 5})
      : assert(htmlMediumRepository != null),
        _htmlMediumRepository = htmlMediumRepository,
        super(HtmlMediumListLoading());

  Stream<HtmlMediumListState> _mapLoadHtmlMediumListToState() async* {
    int amountNow =  (state is HtmlMediumListLoaded) ? (state as HtmlMediumListLoaded).values!.length : 0;
    _htmlMediumsListSubscription?.cancel();
    _htmlMediumsListSubscription = _htmlMediumRepository.listen(
          (list) => add(HtmlMediumListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * htmlMediumLimit : null
    );
  }

  Stream<HtmlMediumListState> _mapLoadHtmlMediumListWithDetailsToState() async* {
    int amountNow =  (state is HtmlMediumListLoaded) ? (state as HtmlMediumListLoaded).values!.length : 0;
    _htmlMediumsListSubscription?.cancel();
    _htmlMediumsListSubscription = _htmlMediumRepository.listenWithDetails(
            (list) => add(HtmlMediumListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * htmlMediumLimit : null
    );
  }

  Stream<HtmlMediumListState> _mapAddHtmlMediumListToState(AddHtmlMediumList event) async* {
    var value = event.value;
    if (value != null) 
      _htmlMediumRepository.add(value);
  }

  Stream<HtmlMediumListState> _mapUpdateHtmlMediumListToState(UpdateHtmlMediumList event) async* {
    var value = event.value;
    if (value != null) 
      _htmlMediumRepository.update(value);
  }

  Stream<HtmlMediumListState> _mapDeleteHtmlMediumListToState(DeleteHtmlMediumList event) async* {
    var value = event.value;
    if (value != null) 
      _htmlMediumRepository.delete(value);
  }

  Stream<HtmlMediumListState> _mapHtmlMediumListUpdatedToState(
      HtmlMediumListUpdated event) async* {
    yield HtmlMediumListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<HtmlMediumListState> mapEventToState(HtmlMediumListEvent event) async* {
    if (event is LoadHtmlMediumList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadHtmlMediumListToState();
      } else {
        yield* _mapLoadHtmlMediumListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadHtmlMediumListWithDetailsToState();
    } else if (event is AddHtmlMediumList) {
      yield* _mapAddHtmlMediumListToState(event);
    } else if (event is UpdateHtmlMediumList) {
      yield* _mapUpdateHtmlMediumListToState(event);
    } else if (event is DeleteHtmlMediumList) {
      yield* _mapDeleteHtmlMediumListToState(event);
    } else if (event is HtmlMediumListUpdated) {
      yield* _mapHtmlMediumListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _htmlMediumsListSubscription?.cancel();
    return super.close();
  }
}


