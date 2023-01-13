class Dog {
  final String name;
  final String breed;
  final int age;

  const Dog({
    required this.name,
    required this.breed,
    this.age = 1,
  });
}
