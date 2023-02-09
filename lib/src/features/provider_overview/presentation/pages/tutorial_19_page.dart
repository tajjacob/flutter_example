import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/counter_provider.dart';
import 'show_me_counter_page.dart';

class Tutorial19Page extends StatelessWidget {
  const Tutorial19Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tutorial 19')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      // return const ShowMeCounterPage();
                      return ChangeNotifierProvider.value(
                        value: context.read<Counter>(),
                        child: const ShowMeCounterPage(),
                      );
                    },
                  ),
                );
              },
              child: const Text('Show me counter'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<Counter>().increment();
              },
              child: const Text('Increment counter'),
            ),
          ],
        ),
      ),
    );
  }
}
