import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_mana/bloc/counter_bloc.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter Bloc',
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is CounterSuccessState || state is CounterInitialState) {
              return Text(
                'Counter value: ${state.counter}',
              );
            } else if (state is CounterErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Counter value: ${state.counter}',
                    ),
                    Text(
                      state.errorMessage,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecrementCounterEvent());
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 13,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncrementCounterEvent());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 13,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(AddValueToCounterEvent(value: 3));
            },
            child: const Icon(Icons.add_box_outlined),
          )
        ],
      ),
    );
  }
}
