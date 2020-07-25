import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class CounterData extends ChangeNotifier {
  SharedPreferences prefs;
  int _counter;
  Random _random = Random();

  Future<void> getSharedPrefsData() async {
    prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('counter') ?? 0;
  }

  int get counter => _counter;

  void increment() async {
    _counter++;

    await prefs.setInt('counter', _counter);

    notifyListeners();
  }

  void decrement() async {
    _counter--;
    await prefs.setInt('counter', _counter);

    notifyListeners();
  }

  void shuffleIncrement() async {
    _counter += _random.nextInt(3) + 1;
   await prefs.setInt('counter', _counter);

    notifyListeners();
  }

  void shuffleDecrement() async {
    _counter -= _random.nextInt(3) + 1;
    await prefs.setInt('counter', _counter);

    notifyListeners();
  }
}
