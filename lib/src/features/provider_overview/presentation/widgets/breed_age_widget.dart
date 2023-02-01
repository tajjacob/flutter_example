import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dog_provider.dart';
import 'age_widget.dart';

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<Dog, String>(
      selector: (context, dog) => dog.breed,
      builder: (_, String breed, __) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('- breed: $breed'),
            const SizedBox(height: 10),
            const Age(),
          ],
        );
      },
    );
  }
}
