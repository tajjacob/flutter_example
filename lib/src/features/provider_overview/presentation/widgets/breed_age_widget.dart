import 'package:flutter/material.dart';

import 'age_widget.dart';

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('- breed: Dog Breed'),
        SizedBox(height: 10),
        Age(),
      ],
    );
  }
}
