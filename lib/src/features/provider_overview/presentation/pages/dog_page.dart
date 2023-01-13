import 'package:flutter/material.dart';

import '../widgets/breed_age_widget.dart';

class DogPage extends StatelessWidget {
  const DogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Overview'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('- name: Dog name'),
            SizedBox(height: 10),
            BreedAndAge(),
          ],
        ),
      ),
    );
  }
}
