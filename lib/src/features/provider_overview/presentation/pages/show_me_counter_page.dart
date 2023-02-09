import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/counter_provider.dart';

class ShowMeCounterPage extends StatelessWidget {
  const ShowMeCounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Show me counter')),
      body: Center(
        child: Text('${context.watch<Counter>().counter}'),
      ),
    );
  }
}
