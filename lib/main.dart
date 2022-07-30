
import 'package:flutter/material.dart';
import 'Stats.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: MainMenu(),
  ));
}

class Exercise{
  Exercise(String name){

  }
}

class MainMenu extends StatefulWidget {
  const MainMenu({ Key? key }) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {


  Widget statsButton(String exercise){
    return Container(
      margin: const EdgeInsets.fromLTRB(5,0,5,0),
      child: ElevatedButton(
        child: Text(exercise),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Stats(value: exercise)));
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
      body: ListView(
        children: [
          statsButton("Pushups"),
          statsButton("Squats"),
          statsButton("Crunches"),
          statsButton("Pullups"),
        ],
      ),
    );
  }
}

