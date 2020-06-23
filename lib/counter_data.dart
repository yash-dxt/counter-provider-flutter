import 'package:flutter/material.dart';
import 'dart:math';


class CounterData extends ChangeNotifier {
  Random _random = Random();
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
  void decrement(){
    _counter--;
    notifyListeners();
  }
  void shuffleIncrement(){
    _counter+= _random.nextInt(3) +1;
    notifyListeners();


  }
  void shuffleDecrement(){
    _counter-= _random.nextInt(3) +1;
    notifyListeners();

  }
}
