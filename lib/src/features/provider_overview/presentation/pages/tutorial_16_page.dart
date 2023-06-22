import 'package:example/src/features/provider_overview/presentation/provider/foo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tutorial16Page extends StatelessWidget {
  const Tutorial16Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tutorial 16 - Provider 09')),
      body: ChangeNotifierProvider<Foo>(
        create: (BuildContext context) => Foo(),
        child:
            Consumer<Foo>(builder: (BuildContext context, Foo foo, Widget? _) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('value: ${foo.value}'),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    foo.changeValue();
                  },
                  child: const Text('Increment'),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
