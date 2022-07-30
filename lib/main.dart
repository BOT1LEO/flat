
import 'package:flutter/material.dart';
import 'stats.dart';
import 'exercise.dart';
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
  bool adding = false;

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
          print(exercise.name);
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
            adding = true;
          });
        }     
      ),
    );
  }

  Widget addExerciseForm(){
    return Container(
      margin: const EdgeInsets.fromLTRB(5,0,5,0),
      child: Column(
        children: [
        TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              label: Text("Exercise"),
            ),
          ),
          Row(
            children: [
              Expanded(child: Container(
              child:ElevatedButton(
                child: Icon(Icons.check_sharp),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                ),
                onPressed: () {
                  setState(() {
                    adding = false;
                  });
                }     
              ),
              ),),
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    child: Icon(Icons.cancel),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    ),
                    onPressed: () {
                      setState(() {
                        adding = false;
                      });
                    }     
                  ),
                ),
              ),
            ],
          ),
        ],
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
          else {
            if(adding){
              return addExerciseForm();
            }else{
              return addExerciseButton();
            }
          }
        }
      ),
    );
  }
}

