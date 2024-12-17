
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MemoryMazeViewModel extends BaseViewModel{
  List<String> words = ["Apple", "Banana", "Orange", "Grape", "Mango","Pineapple"];
  List<String> shuffledWords = [];
  List<String> userOrder = [];
  bool isMemorizationPhase = true;
  int timer = 15; // timer for memorization phase
  late Timer countdownTimer;
  int currentLevel = 1;
  bool isGameOver = false;
 // bool _running=true;

 // void checkOrder() {
//     debugPrint('user ${userOrder.join()} words $shuffledWords');
//     if (userOrder.length == words.length && userOrder.join() == shuffledWords.join()) {
//       setState(() {
//         currentLevel++;
//         userOrder.clear();
//         shuffledWords.clear();
//         shuffledWords.addAll(words);
//         shuffledWords.shuffle();
//         timer = 15;
//         isMemorizationPhase = true;
//         startTimer();
//       });
//     } else {
//       // Show an error if the order is incorrect
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Incorrect Order, Try Again!")),
//       );
//     }
//   }
  checkorder(BuildContext context){
    debugPrint('user ${userOrder.join()} words $shuffledWords');
    if (userOrder.length == words.length && userOrder.join() == shuffledWords.join()) {
        currentLevel++;
       gamestart();
       notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("hurrray,welcome to next level")),
        );
    } else {
      // Show an error if the order is incorrect
      isGameOver = true;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Incorrect Order, Try Again!")),
      );
    }

  }
  void startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (this.timer > 0) {
          this.timer--;
          notifyListeners();
        } else {
          isMemorizationPhase = false;
          countdownTimer.cancel();
          notifyListeners();
        }
    });
  }
  // tryAgain(){
  //   userOrder.clear();
  //   notifyListeners();
  // }
  onRearrange(String word) {
    if (userOrder.length < words.length) {

        userOrder.add(word);debugPrint(word);
     notifyListeners();
    }
  }

  gamestart(){
    isGameOver= false;
                  userOrder.clear();
                  shuffledWords.clear();
                  //shuffledWords.addAll(words);
                 shuffledWords = words.sublist(0,3+(currentLevel ~/ 5));
                  shuffledWords.shuffle();
                 // isMemorizationPhase = !isMemorizationPhase;
                  timer = 15;
                   isMemorizationPhase = true;
                  startTimer();
    notifyListeners();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    countdownTimer.cancel();
    super.dispose();
  }
}