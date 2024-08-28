import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobility_sqr/ApiCall/Repository.dart';
import 'package:mobility_sqr/ModelClasses/Approval.dart';

part 'travel_req_event.dart';

part 'travel_req_state.dart';

class TravelReqBloc extends Bloc<TravelReqEvent, TravelReqState> {
  final Repository repository;

  TravelReqBloc(this.repository) : super(TravelReqInitial()) {
    on<TravelReqEvent>((event, emit) async {
      emit(TravelReqLoading());
      if (event is FetchTravelReq) {
        try {
          final ApprovalModal quote = await repository.fetch_travel_req();
          emit(TravelReqLoaded(travelRequest: quote));
        } catch (_) {
          emit(TravelReqError("Couldn't Fetch Data"));
        }
      }
    });
  }
}
