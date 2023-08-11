import 'dart:math';

import 'package:comidas_liondev/models/worker.dart';
import 'package:comidas_liondev/ui/screens/settings_screen.dart';
import 'package:flutter/material.dart';

import '../../models/food.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Worker> workers = [];
  int budgetFortNight = 116;
  int numberOfDays = 14;
  double costBreakFast = 1.0;
  double costLunch = 1.0;
  int numberBreakFast = 0;
  int numberLunch = 0;

  @override
  void initState() {
    numberBreakFast = (budgetFortNight / 2) ~/ costBreakFast;
    numberLunch = (budgetFortNight / 2) ~/ costLunch;

    for (int i = 0; i < 30; i++) {
      workers.add(Worker(
          name: 'Colaborador -',
          lastName: '${i + 1}',
          salary: (i + 1) * 100,
          food: []));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Comidas LionDev'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => const SettingsScreen()));
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: /*SfCalendar(
        view: CalendarView.month,
      ),*/
          Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  ListTile(
                    leading: Icon(Icons.calendar_month_outlined),
                    title: Text('Número de dias quincena'),
                    subtitle: Text('14'),
                  ),
                  ListTile(
                    leading: Icon(Icons.coffee),
                    title: Text('Número desayunos'),
                    subtitle: Text('58'),
                  ),
                  ListTile(
                    leading: Icon(Icons.fastfood_rounded),
                    title: Text('Número comidas'),
                    subtitle: Text('58'),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton.extended(
              extendedIconLabelSpacing: 20,
              elevation: 1,
              onPressed: () {
                _distribute();
              },
              label: const Text('Repartir Alimentos'),
              icon: const Icon(Icons.reply_all_rounded),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: workers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text(workers[index].toString()),
                    subtitle: Text(workers[index].food.length.toString()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _distribute() {
    List<Food> listBreakFast =
        _getListOfFood(costBreakFast, TypeFood.breakfast, numberBreakFast);
    List<Food> listLunch =
        _getListOfFood(costLunch, TypeFood.lunch, numberLunch);
    print(listBreakFast.length);
    print(listLunch.length);
    List<Food> totalFoodList = listBreakFast + listLunch;

    //TODO: Repartir los alimentos entre los trabajadores de forma aleatoria;
    for (Food food in totalFoodList) {}

    while (listBreakFast.isNotEmpty || listLunch.isNotEmpty) {
      int indexWorker = _generateRandomIndex(workers.length);
      Food? food;
      if (listLunch.isNotEmpty && listBreakFast.isNotEmpty) {
        food = Random().nextInt(1) > 0
            ? listBreakFast.removeLast()
            : listLunch.removeLast();
      } else {
        if (listLunch.isNotEmpty) {
          food = listLunch.removeLast();
        } else {
          food = listBreakFast.removeLast();
        }
      }
      print('$indexWorker');
      Worker currentWorker = workers[indexWorker];
      if (currentWorker.food.isEmpty) {
        currentWorker.food.add(food!);
      } else if (currentWorker.food.length <
          _meanOfFood(totalFoodList.length, workers.length)) {
        currentWorker.food.add(food!);
      }
    }

    setState(() {});
    print('desayunos restantes: ${listBreakFast.length}');
    print('comidas restantes: ${listLunch.length}');

    //TODO: Crear la lista de dias y asignar de forma aleatoria trabajadores a los dias
  }

  List<Food> _getListOfFood(double price, TypeFood type, int numberOfFood) {
    List<Food> result = [];
    for (int i = 0; i < numberOfFood; i++) {
      result.add(Food(typeFood: type, price: price));
    }
    return result;
  }

  int _generateRandomIndex(int len) => Random().nextInt(len);
  int _meanOfFood(int lenTotalFood, lenWorkes) => lenTotalFood ~/ lenWorkes;
}
