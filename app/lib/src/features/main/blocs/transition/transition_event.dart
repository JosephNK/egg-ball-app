part of 'transition_bloc.dart';

abstract class TransitionEvent extends Equatable {}

class TransitionSplashEvent extends TransitionEvent {
  @override
  List<Object> get props => [];
}

class TransitionSignInEvent extends TransitionEvent {
  @override
  List<Object> get props => [];
}

class TransitionSignUpEvent extends TransitionEvent {
  @override
  List<Object> get props => [];
}

class TransitionMainEvent extends TransitionEvent {
  final bool isFirstLoad;

  TransitionMainEvent({
    this.isFirstLoad = true,
  });

  @override
  List<Object?> get props => [
        isFirstLoad,
      ];
}

class TransitionErrorEvent extends TransitionEvent {
  @override
  List<Object> get props => [];
}
