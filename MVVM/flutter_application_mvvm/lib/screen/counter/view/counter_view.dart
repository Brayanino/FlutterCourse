import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/counter_viewmodel.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterViewmodel(),
      builder: (context, __) => Scaffold(
        appBar: AppBar(title: const Text("Counter with MVVM")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<CounterViewmodel>(
                  builder: (context, counterViewModel, child) {
                return Text('${context.watch<CounterViewmodel>().count}',
                    style: Theme.of(context).textTheme.headlineMedium);
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () =>
                        context.read<CounterViewmodel>().increment(),
                    tooltip: 'Increment',
                    heroTag: null,
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 16),
                  FloatingActionButton(
                    onPressed: () =>
                        context.read<CounterViewmodel>().decrement(),
                    tooltip: 'Decrement',
                    heroTag: null,
                    child: const Icon(Icons.remove),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
