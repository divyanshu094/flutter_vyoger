import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobility_sqr/ApiCall/Repository.dart';
import 'package:mobility_sqr/ModelClasses/Approval.dart';

part 'aprrovals_event.dart';

part 'aprrovals_state.dart';

class AprrovalsBloc extends Bloc<AprrovalsEvent, AprrovalsState> {
  final Repository repository;

  AprrovalsBloc(this.repository) : super(AprrovalsInitial()) {
    on<AprrovalsEvent>((event, emit) async {
      AprrovalsLoading();
      if (event is Fetch_travel_req_approver) {
        try {
          final ApprovalModal quote = await repository.fetch_Aprroval_list();
          AprrovalsLoaded(approvalModal: quote);
        } catch (_) {
          AprrovalsError("Couldn't Fetch Data");
        }
      }
      if (event is Fetch_previous_req) {
        try {
          final ApprovalModal quote = await repository.fetch_travel_req();
          AprrovalsLoaded(approvalModal: quote);
        } catch (_) {
          AprrovalsError("Couldn't Fetch Data");
        }
      }
    });
  }
}
