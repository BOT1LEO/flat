
import 'package:flutter/material.dart';

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

class Stats extends StatefulWidget {
  String value = "";
  Stats({key,required this.value});
  @override
  State<Stats> createState() => _StatsState(value: value);
}

class _StatsState extends State<Stats> {
  int selectedIndex = 0;
  String value = "";
  _StatsState({required this.value});


  static Widget add(){
    return Center(
      child:  
        Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Reps",
              ),
            ),
          ],
        ),
      
    );
  }

  static Widget graph(){
    return Center(
        //todo graph
      );
  }

  static Widget settings(){
    //todo settings
    return Center(
      
    );
  }

  final _widgetOptions = [
    add(),
    graph(),
    settings()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(value),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(child: _widgetOptions.elementAt(selectedIndex)),
      bottomNavigationBar:BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Add"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            label: "Graph"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings"
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
        
      )
    );
  }
}