part of 'transition_bloc.dart';

abstract class TransitionState extends Equatable {}

class TransitionInitialState extends TransitionState {
  TransitionInitialState();

  @override
  List<Object> get props => [];
}

class TransitionLoadingState extends TransitionState {
  TransitionLoadingState();

  @override
  List<Object> get props => [];
}

class TransitionSplashState extends TransitionState {
  TransitionSplashState();

  @override
  List<Object> get props => [];
}

class TransitionMainState extends TransitionState {
  TransitionMainState();

  @override
  List<Object> get props => [];
}

class TransitionErrorState extends TransitionState {
  TransitionErrorState();

  @override
  List<Object> get props => [];
}
