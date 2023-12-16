part of 'counter_bloc.dart';

@immutable
class CounterState {

  final int counter;

  const CounterState({required this.counter});
}

class CounterInitial extends CounterState {
  const CounterInitial({super.counter = 0});
}

