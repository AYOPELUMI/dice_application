import 'dart:math';

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
      Fluttertoast.showToast(msg: 'A 6 has been thrown!');
    } else if (diceNumber.value % 2 == 0) {
      Fluttertoast.showToast(msg: 'An even number is thrown!');
    } else {
      Fluttertoast.showToast(msg: 'An odd number is thrown!');
    }

    if (rollCount.value == 6) {
      Fluttertoast.showToast(msg: 'Total rolls: ${totalRolls.value}');
      rollCount.value = 0;
    }
  }
}
