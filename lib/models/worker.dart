import 'food.dart';

class Worker {
  Worker(
      {required this.name,
      required this.lastName,
      required this.salary,
      required this.food});

  String name;
  String lastName;
  double salary;
  List<Food> food;

  @override
  String toString() {
    return '$name $lastName';
  }
}
