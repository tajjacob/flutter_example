import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dog_provider.dart';

class Age extends StatelessWidget {
  const Age({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Dog>(
      builder: (_, dog, __) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('- age: ${dog.age}'),
            const SizedBox(height: 10),
            Text('- number of babies: ${context.read<int>()}'),
            const SizedBox(height: 10),
            Text('- number of barks: ${context.watch<String>()}'),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  dog.grow();
                },
                child: const Text('Grow')),
          ],
        );
      },
    );
  }
}
