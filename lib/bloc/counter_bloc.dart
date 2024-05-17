import 'package:bloc/bloc.dart';

abstract class CounterEvent {}

class IncrementCounterEvent extends CounterEvent {}

class DecrementCounterEvent extends CounterEvent {}

class AddValueToCounterEvent extends CounterEvent {
  final int value;
  AddValueToCounterEvent({required this.value});
}

abstract class CounterState {
  final int counter;

  CounterState({required this.counter});
}

class CounterSuccessState extends CounterState {
  CounterSuccessState({required super.counter});
}

class CounterErrorState extends CounterState {
  final String errorMessage;
  CounterErrorState({required super.counter, required this.errorMessage});
}

// Definir l'etat initial du counter

class CounterInitialState extends CounterState {
  CounterInitialState() : super(counter: 0);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState()) {
    on((IncrementCounterEvent event, emit) {
      if (state.counter < 10) {
        emit(CounterSuccessState(counter: state.counter + 1));
      } else {
        emit(CounterErrorState(
            counter: state.counter - 1,
            errorMessage: 'Le compteur ne peut pas depasser 10'));
      }
    });
    on((DecrementCounterEvent event, emit) {
      if (state.counter > 0) {
        emit(CounterSuccessState(counter: state.counter - 1));
      } else {
        emit(CounterErrorState(
            counter: state.counter + 1,
            errorMessage: 'Le compteur ne pas etre inferieur a 0'));
      }
    });
    on((AddValueToCounterEvent event, emit) {
      if (state.counter < 10 - event.value) {
        emit(CounterSuccessState(counter: state.counter + event.value));
      } else {
        emit(CounterErrorState(
            counter: state.counter,
            errorMessage: 'Le compteur ne peut pas depasser 10'));
      }
    });
  }
}
