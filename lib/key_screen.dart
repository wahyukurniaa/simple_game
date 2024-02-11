import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_game/controller.dart';

class KeyScreen extends StatelessWidget {
  final GameController controller = Get.put(GameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tebak angka antara 1 dan 100',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Obx(() => Text(
                  controller.feedback.value,
                  style: const TextStyle(fontSize: 18, color: Colors.blue),
                )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) => controller.guess.value = value,
                    decoration: const InputDecoration(
                      hintText: 'Tebakan Anda',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.checkGuess();
                  },
                  child: const Text('Tebak'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.resetGame();
              },
              child: const Text('Mulai Ulang'),
            ),
          ],
        ),
      ),
    );
  }
}
