import 'package:comidas_liondev/models/worker.dart';

class Day {
  Day({required this.date, required this.workers});
  DateTime date;
  List<Worker> workers;
}
