import 'dart:math';
import 'package:get/get.dart';

class GameController extends GetxController {
  var randomNumber = Random().nextInt(10) + 1;
  var guess = ''.obs;
  var feedback = ''.obs;

  void checkGuess() {
    int? userGuess = int.tryParse(guess.value);
    if (userGuess != null) {
      if (userGuess == randomNumber) {
        feedback.value =
            'Tebakan Anda benar! Angka yang benar adalah $randomNumber.';
      } else if (userGuess < randomNumber) {
        feedback.value = 'Tebakan Anda terlalu rendah';
      } else {
        feedback.value = 'Tebakan Anda terlalu tinggi';
      }
    } else {
      feedback.value = 'Masukkan angka yang valid';
    }
  }

  void resetGame() {
    randomNumber = Random().nextInt(10) + 1;
    guess.value = '';
    feedback.value = '';
  }
}
