import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/dice_controller.dart';

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
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
                return Image.asset('assets/${diceController.diceNumber.value}.png');
              }
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: diceController.rollDice,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFFAB82920)),
              ),
              child: Text('Roll Dice',style: TextStyle(color: Colors.white, fontSize:15)),
            ),
          ],
        ),
      ),
    );
  }
}
