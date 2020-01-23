import 'package:flutter/material.dart';
import 'package:mvvm_test/counter_view_model.dart';
import 'package:provider_architecture/provider_architecture.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModel: CounterViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo Home Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${model.counter}', //                           <-- view model
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            model.increment(); //                                <-- view model
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
      onModelReady: (model) => model.loadData(),
    );
  }
}