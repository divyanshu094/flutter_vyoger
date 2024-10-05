import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mobility_sqr/ApiCall/Repository.dart';
import 'package:mobility_sqr/ModelClasses/PurposeModelClass.dart';

part 'purpose_event.dart';

part 'purpose_state.dart';

class PurposeBloc extends Bloc<PurposeEvent, PurposeState> {
  final Repository repository;

  PurposeBloc(this.repository) : super(PurposeInitial()) {
    on<PurposeEvent>((event, emit) async {
      emit(PurposeLoading());
      if (event is FetchPurposelist) {
        try {
          final PurposeModelClass result =
              await repository.getPurposeList(event.iataCode);
          emit(PurposeLoaded(purposelist: result));
        } catch (_) {
          emit(PurposeError("Couldn't Fetch Data"));
        }
      }
    });
  }
}
