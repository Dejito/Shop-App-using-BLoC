part of 'homepage_bloc.dart';

@immutable
abstract class HomepageEvent {}

class HomePageDots extends HomepageEvent{
  final int index;

   HomePageDots(this.index);
}