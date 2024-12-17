import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.router.dart';


// flutter pub run build_runner build --delete-conflicting-outputs


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
       //  primarySwatch:MaterialColor(Colors.green.value,{
       //    50: tintColor(Colors.green, 0.9),
       //    100: tintColor(Colors.green, 0.8),
       //    200: tintColor(Colors.green, 0.6),
       //    300: tintColor(Colors.green, 0.4),
       //    400: tintColor(Colors.green, 0.2),
       //    500: Colors.green,
       //    600: shadeColor(Colors.green, 0.1),
       //    700: shadeColor(Colors.green, 0.2),
       //    800: shadeColor(Colors.green, 0.3),
       //    900: shadeColor(Colors.green, 0.4),
       //
       //  })
      ),
      builder: (context,child){
        return MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)), child: child!);
      },
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver
      ],

    );
  }
}



// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp( MyApp());
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Memory Game',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: GameScreen(),
//     );
//   }
//
// }
//
// class GameScreen extends StatefulWidget {
//   @override
//   _GameScreenState createState() => _GameScreenState();
// }
//
// class _GameScreenState extends State<GameScreen> {
//   List<String> words = ["Apple", "Banana", "Orange", "Grape", "Mango"];
//   List<String> shuffledWords = [];
//   List<String> userOrder = [];
//   bool isMemorizationPhase = true;
//   int timer = 15; // timer for memorization phase
//   late Timer countdownTimer;
//   int currentLevel = 1;
//   bool isGameOver = false;
//
//   @override
//   void initState() {
//     super.initState();
//     shuffledWords = List.from(words);
//     shuffledWords.shuffle();
//     startTimer();
//   }
//
//   void startTimer() {
//     countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         if (this.timer > 0) {
//           this.timer--;
//         } else {
//           isMemorizationPhase = false;
//           countdownTimer.cancel();
//         }
//       });
//     });
//   }
//
//   void onRearrange(String word) {
//     if (userOrder.length < words.length) {
//       setState(() {
//         userOrder.add(word);debugPrint(word);
//       });
//     }
//   }
//
//   void checkOrder() {
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
//
//   @override
//   void dispose() {
//     countdownTimer.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Memory Game - Level $currentLevel"),
//       ),
//       body: Center(
//         child: isMemorizationPhase
//             ? Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Memorize the words", style: TextStyle(fontSize: 24)),
//             SizedBox(height: 20),
//             Text("Time remaining: $timer", style: TextStyle(fontSize: 20)),
//             SizedBox(height: 20),
//              ...shuffledWords.map((word) => Text(word, style: TextStyle(fontSize: 18))),
//             //not shuffledWords.map((word) => Text(word, style: TextStyle(fontSize: 18))),
//           ],
//         )
//             : Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Rearrange the words", style: TextStyle(fontSize: 24)),
//             SizedBox(height: 20),
//             Wrap(
//               children: words
//                   .map((word) =>Ec(onRearrange,word))
//                   .toList(),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: checkOrder,
//               child: Text("Check Order"),
//             ),
//             ElevatedButton(
//               onPressed: (){
//                 setState(() {
//                   currentLevel++;
//                   userOrder.clear();
//                   shuffledWords.clear();
//                   shuffledWords.addAll(words);
//                   shuffledWords.shuffle();
//                   isMemorizationPhase = !isMemorizationPhase;
//                   timer = 15;
//                   // isMemorizationPhase = true;
//                   startTimer();
//                 });
//
//               },
//               child: Text("start again"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Ec extends StatefulWidget {
//   void Function(String word) onRearrange;
//
//   var word;
//    Ec(this.onRearrange, this.word, {super.key});
//
//   @override
//   State<Ec> createState() => _EcState();
// }
//
// class _EcState extends State<Ec> {
//   bool isclicked = false;
//   @override
//   Widget build(BuildContext context) {
//     return  GestureDetector(
//       onTap: (){
//         if(!isclicked){
//           setState(() {
//             isclicked=true;
//           });
//           widget.onRearrange(widget.word);
//         }
//       },
//       child: Card(
//         surfaceTintColor: isclicked?Colors.black:null,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(widget.word, style: TextStyle(fontSize: 18)),
//         ),
//       ),
//     );
//   }
// }
//
