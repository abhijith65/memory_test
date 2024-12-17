
import 'package:flutter/material.dart';
import 'package:memorymaze/views/screens/memorymaze/viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../widget/ec.dart';


class MemoryMazeView extends StatelessWidget {
  const MemoryMazeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MemoryMazeViewModel>.reactive(
      onViewModelReady: (model){
        model.gamestart();
        debugPrint('viewmodel ready');
      },
      builder: (context,model,child){
        return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Memory Game - Level ${model.currentLevel}"),
      ),
      body: Center(
        child: model.isMemorizationPhase
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Memorize the words", style: TextStyle(fontSize: 24)),Text('${model.shuffledWords.length}'),
            SizedBox(height: 20),
            Text("Time remaining: ${model.timer}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
             ...model.shuffledWords.map((word) => Text(word, style: TextStyle(fontSize: 18))),
            //not shuffledWords.map((word) => Text(word, style: TextStyle(fontSize: 18))),
          ],
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Rearrange the words", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Wrap(
              children: model.words
                  .map((word) =>Ec(model.onRearrange,word))
                  .toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                model.checkorder(context);
              },
              child: Text("Check Order"),
            ),
            ElevatedButton(
              onPressed: (){
                model.gamestart();
              },
              child: Text("start again"),
            ),
          ],
        ),
      ),
    );
      },
      viewModelBuilder: ()=>MemoryMazeViewModel(),
      onDispose: (m)=>m.dispose(),
    );
  }

}