import 'package:example/src/features/provider_overview/presentation/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/json_placeholder/presentation/provider/todo_provider.dart';
import '../features/provider_overview/presentation/provider/babies_provider.dart';
import '../features/provider_overview/presentation/provider/dog_provider.dart';

class MultiProviders extends StatelessWidget {
  const MultiProviders({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
        ChangeNotifierProvider<Dog>(
            create: (context) => Dog(name: 'Jack', breed: 'chihuahua', age: 3)),
        FutureProvider(
          create: (context) {
            final int dogAge = context.read<Dog>().age;
            final babies = Babies(age: dogAge);
            return babies.getBabies();
          },
          initialData: 0,
        ),
        StreamProvider(
            create: (context) {
              final int dogAge = context.read<Dog>().age;
              final babies = Babies(age: dogAge * 2);
              return babies.bark();
            },
            initialData: 'Bark 0 times'),
        ChangeNotifierProvider<Counter>(
          create: (context) => Counter(),
        ),
      ],
      child: child,
    );
  }
}
