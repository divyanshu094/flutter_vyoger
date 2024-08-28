import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobility_sqr/ApiCall/Repository.dart';
import 'package:mobility_sqr/ModelClasses/ProjectIdModel.dart';

part 'project_id_event.dart';

part 'project_id_state.dart';

class ProjectIdBloc extends Bloc<ProjectIdEvent, ProjectIdState> {
  final Repository repository;

  ProjectIdBloc(this.repository) : super(ProjectIdInitial()) {
    on<ProjectIdEvent>((event, emit) async {
      emit(ProjectIdLoading());
      if (event is FetchProject) {
        try {
          final ProjectIdModel result =
              await repository.GetProjectId(event.pid);
          if (result.data.length > 0) {
            emit(ProjectIdLoaded(projectIdModel: result));
          } else {
            emit(ProjectIdError("No Search Result Found"));
          }
        } catch (_) {
          emit(ProjectIdError("Couldn't Fetch Data"));
        }
      }
    });
  }

  // @override
  // ProjectIdState get initialState => ProjectIdInitial();
  //
  // @override
  // Stream<ProjectIdState> mapEventToState(
  //   ProjectIdEvent event,
  // ) async* {
  //   yield ProjectIdLoading();
  //   if (event is FetchProject) {
  //     try {
  //       final ProjectIdModel result = await repository.GetProjectId(event.pid);
  //       if (result.data.length > 0) {
  //         yield ProjectIdLoaded(projectIdModel: result);
  //       } else {
  //         yield ProjectIdError("No Search Result Found");
  //       }
  //     } catch (_) {
  //       yield ProjectIdError("Couldn't Fetch Data");
  //     }
  //   }
  // }
}
