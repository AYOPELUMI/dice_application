import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/dice_controller.dart';

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: DicePage(),
    );
  }
}

class DicePage extends StatelessWidget {
  final DiceController diceController = Get.put(DiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() {
              if (diceController.isLoading.value) {
                return CircularProgressIndicator();
              } else {
                return Image.asset('assets/dice${diceController.diceNumber}.png');
              }
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: diceController.rollDice,
              child: Text('Roll Dice'),
            ),
          ],
        ),
      ),
    );
  }
}