import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DiceController extends GetxController {
  var diceNumber = 1.obs;
  var rollCount = 0.obs;
  var totalRolls = 0.obs;
  var isLoading = false.obs;

  void rollDice() async {
    isLoading.value = true;

    // Shuffling effect
    for (int i = 0; i < 10; i++) {
      diceNumber.value = Random().nextInt(6) + 1;
      await Future.delayed(Duration(milliseconds: 100));
    }

    diceNumber.value = Random().nextInt(6) + 1;
    rollCount.value++;
    totalRolls.value++;
    isLoading.value = false;

    if (diceNumber.value == 6) {
      Fluttertoast.showToast(
        msg: 'A 6 has been thrown!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,);
    } else if (diceNumber.value % 2 == 0) {
      Fluttertoast.showToast(
        msg: 'An even number is thrown!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,);
    } else {
      Fluttertoast.showToast(
        msg: 'An odd number is thrown!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }

    if (rollCount.value == 6) {
      Fluttertoast.showToast(
        msg: 'Total rolls: ${totalRolls.value}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.blueAccent,
        textColor: Colors.white,
        fontSize: 16.0,);
      rollCount.value = 0;
    }
  }
}
