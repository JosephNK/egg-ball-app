library home_main_blocs;

import 'dart:async';

import 'package:eggball/src/controllers/controller.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_common.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_network.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_store.dart';

import 'home_main_state.dart';

export 'home_main_state.dart';

part 'home_main_event.dart';

class HomeMainBloc extends Bloc<HomeMainEvent, HomeMainState> {
  HomeMainBloc() : super(const HomeMainInitialState()) {
    on<HomeMainFetchEvent>(
      (event, emit) => _mapFetchToState(event, emit),
    );
    on<HomeMainUpdateEvent>(
      (event, emit) => _mapUpdateToState(event, emit),
    );
  }

  HomeMainLoadedState get loadedState => state as HomeMainLoadedState;

  Future<void> _mapFetchToState(
    HomeMainFetchEvent event,
    Emitter<HomeMainState> emit,
  ) async {
    final isFirstLoad = event.isFirstLoad;

    if (isFirstLoad) {
      emit(const HomeMainLoadingState());
    }

    try {
      ResultValue<bool> resultValue = ResultValue.fromValue<bool>(data: false);
      ErrorValue? errorValueFaq;

      emit(const HomeMainLoadedState());

      List<ErrorValue?> errorValues = [
        errorValueFaq,
      ];

      if (event.completer == null) {
        AppController.shared.waitShowAlertErrorValues(errorValues);
      }

      event.completer?.complete(resultValue.copyWith(
        data: () => errorValues.whereNotNull().isEmpty,
        errorValue: () => ErrorValue.getLastErrorValues(errorValues),
      ));
    } catch (e) {
      Logging.e('bloc source exception => $e');

      if (e is UnauthorisedException) rethrow;

      emit(HomeMainErrorState(
        errorValue: ErrorValue.fromException(exception: e),
      ));

      event.completer?.complete(ResultValue.fromValue<bool>(data: false));
    }
  }

  Future<void> _mapUpdateToState(
    HomeMainUpdateEvent event,
    Emitter<HomeMainState> emit,
  ) async {
    if (state is! HomeMainLoadedState) {
      throw Exception('It is not in Loaded State.');
    }

    try {
      ResultValue<bool> resultValue = ResultValue.fromValue<bool>(data: false);
      ErrorValue? errorValueFaq;

      List<ErrorValue?> errorValues = [
        errorValueFaq,
      ];

      event.completer?.complete(resultValue.copyWith(
        data: () => errorValues.whereNotNull().isEmpty,
        errorValue: () => ErrorValue.getLastErrorValues(errorValues),
      ));
    } catch (e) {
      Logging.e('bloc source exception => $e');

      emit(HomeMainErrorState(
        errorValue: ErrorValue.fromException(exception: e),
      ));

      event.completer?.complete(ResultValue.fromValue<bool>(data: false));
    }
  }
}
