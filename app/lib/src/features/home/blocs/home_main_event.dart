part of 'home_main_bloc.dart';

abstract class HomeMainEvent extends Equatable {}

class HomeMainLoadingEvent extends HomeMainEvent {
  @override
  List<Object> get props => [];
}

class HomeMainFetchEvent extends HomeMainEvent {
  final Completer<ResultValue<bool>>? completer;
  final bool isFirstLoad;

  HomeMainFetchEvent({
    this.completer,
    this.isFirstLoad = true,
  });

  @override
  List<Object?> get props => [
        completer,
        isFirstLoad,
      ];
}

class HomeMainUpdateEvent extends HomeMainEvent {
  final Completer<ResultValue<bool>>? completer;

  HomeMainUpdateEvent({
    this.completer,
  });

  @override
  List<Object?> get props => [
        completer,
      ];
}
