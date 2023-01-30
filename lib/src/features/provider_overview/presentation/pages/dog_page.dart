import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/dog_model.dart';
import '../widgets/breed_age_widget.dart';

class DogPage extends StatefulWidget {
  const DogPage({Key? key}) : super(key: key);

  @override
  State<DogPage> createState() => _DogPageState();
}

class _DogPageState extends State<DogPage> {
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
          children: [
            Text('- name: ${context.watch<Dog>().name}'),
            const SizedBox(height: 10),
            const BreedAndAge(),
          ],
        ),
      ),
    );
  }
}
