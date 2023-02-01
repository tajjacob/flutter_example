import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dog_provider.dart';
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
        title: const Text('Provider Overview - 17. Selector'),
      ),
      body: Selector<Dog, String>(
        selector: (context, dog) => dog.name,
        builder: (context, String name, child) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('- name: $name'),
                const SizedBox(height: 10),
                const BreedAndAge(),
              ],
            ),
          );
        },
      ),
    );
  }
}
