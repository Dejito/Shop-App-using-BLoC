import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<TriggerAppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<TriggerAppEvent>(_updateIndex);
    // on<AppEvent>((event, emit) {
    //   emit((AppState(index: event.index)));
    // });
  }

  void _updateIndex(TriggerAppEvent event, Emitter<AppState> emit) {
    emit(AppState(index: event.index));
  }

}
