import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/dog_model.dart';
import 'age_widget.dart';

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('- breed: ${context.select<Dog, String>((Dog dog) => dog.breed)}'),
        const SizedBox(height: 10),
        const Age(),
      ],
    );
  }
}
