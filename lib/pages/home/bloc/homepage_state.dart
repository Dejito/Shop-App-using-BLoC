part of 'homepage_bloc.dart';

// @immutable
class HomepageState {

  final int index;

  HomepageState({this.index = 0});

  HomepageState copyWith(int? index){
    return HomepageState(index: index ?? this.index);
  }
}

// class HomepageInitial extends HomepageState {}
