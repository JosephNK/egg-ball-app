library splash_blocs;

import 'dart:async';

import 'package:flutter_leaf_kit/flutter_leaf_kit_common.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_network.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_store.dart';

import 'splash_state.dart';

export 'splash_state.dart';

part 'splash_event.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashInitialState()) {
    on<SplashFetchEvent>(
      (event, emit) => _mapFetchToState(event, emit),
    );
    on<SplashFinishEvent>(
      (event, emit) => _mapFinishToState(event, emit),
    );
  }

  SplashLoadedState get loadedState => (state as SplashLoadedState);

  // final _interceptor = SplashInterceptor();

  Future<void> _mapFetchToState(
    SplashFetchEvent event,
    Emitter<SplashState> emit,
  ) async {
    final isFirstLoad = event.isFirstLoad;

    if (isFirstLoad) {
      emit(const SplashLoadingState());
    }

    try {
      ResultValue<bool> resultValue = ResultValue.fromEmpty<bool>();

      emit(const SplashLoadedState(
        finish: false,
        loading: true,
      ));

      if (state is SplashLoadedState) {
        emit(loadedState.copyWith(
          finish: () => true,
          loading: () => false,
        ));
      }

      resultValue = ResultValue.fromSuccess<bool>(true);

      event.completer?.complete(resultValue);
    } catch (e) {
      Logging.e('bloc source exception => $e');

      if (e is UnauthorisedException) rethrow;

      emit(SplashErrorState(
        errorValue: ErrorValue.fromException(exception: e),
      ));

      event.completer?.complete(ResultValue.fromEmpty());
    }
  }

  Future<void> _mapFinishToState(
    SplashFinishEvent event,
    Emitter<SplashState> emit,
  ) async {
    ResultValue<bool> resultValue = ResultValue.fromEmpty<bool>();

    if (state is SplashLoadedState) {
      emit(loadedState.copyWith(
        finish: () => true,
      ));
    }

    event.completer?.complete(resultValue);
  }
}
