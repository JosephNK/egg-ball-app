part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {}

class SplashLoadingEvent extends SplashEvent {
  @override
  List<Object> get props => [];
}

class SplashFetchEvent extends SplashEvent {
  final Completer<ResultValue<bool>>? completer;
  final bool isFirstLoad;

  SplashFetchEvent({
    this.completer,
    this.isFirstLoad = true,
  });

  @override
  List<Object?> get props => [
        completer,
        isFirstLoad,
      ];
}

class SplashFinishEvent extends SplashEvent {
  final Completer<ResultValue<bool>>? completer;

  SplashFinishEvent({
    this.completer,
  });

  @override
  List<Object?> get props => [
        completer,
      ];
}
