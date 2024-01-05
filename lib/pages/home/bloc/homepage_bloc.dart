import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(HomepageState()) {

    on<HomePageDots>(_homepageDots);
  }
  void _homepageDots (HomePageDots event, Emitter<HomepageState> emit) {
    emit(state.copyWith(event.index));
  }
}
