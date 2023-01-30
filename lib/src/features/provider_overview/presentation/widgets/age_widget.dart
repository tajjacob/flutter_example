import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/dog_model.dart';

class Age extends StatelessWidget {
  const Age({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('- age: ${context.select<Dog, int>((Dog dog) => dog.age)}'),
        const SizedBox(height: 10),
        Text('- number of babies: ${context.read<int>()}'),
        const SizedBox(height: 10),
        ElevatedButton(
            onPressed: () {
              context.read<Dog>().grow();
            },
            child: const Text('Grow'))
      ],
    );
  }
}
