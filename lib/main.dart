
import 'package:flutter/material.dart';
import 'Stats.dart';
import 'Exercise.dart';
void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: MainMenu(),
  ));
}

class MainMenu extends StatefulWidget {
  const MainMenu({ Key? key }) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {

  List<Exercise> exerciseList = [
    Exercise("Pushups"),
    Exercise("Crunches"),
    Exercise("Squats"),
    Exercise("Pullups"),
  ];

  Widget statsButton(Exercise exercise){
    return Container(
      margin: const EdgeInsets.fromLTRB(5,0,5,0),
      child: ElevatedButton(
        child: Text(exercise.name),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Stats(value: exercise)));
        }     
      ),
    );
  }

  Widget addExerciseButton(){
    return Container(
      margin: const EdgeInsets.fromLTRB(5,0,5,0),
      child: ElevatedButton(
        child: const Text("Add"),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        ),
        onPressed: () {
          setState(() {
            exerciseList.add(Exercise("Hiiii!"));
          });
        }     
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StatTracker"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: exerciseList.length+1,
        itemBuilder: (context,index) {
          if(index<exerciseList.length){return statsButton(exerciseList[index]);}
          else {return addExerciseButton();}
        }
      ),
    );
  }
}

