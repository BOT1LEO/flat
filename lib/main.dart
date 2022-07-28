
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StatTracker"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          ElevatedButton(
            child: const Text("Pushup"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Stats(value: "Pushups")));
            } 
            ),
        ],
      ),
    );
  }
}

class Stats extends StatefulWidget {
  String value = "";
  Stats({required this.value});
  @override
  State<Stats> createState() => _StatsState(value: value);
}

class _StatsState extends State<Stats> {
  String value = "";
  _StatsState({required this.value});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(value),
        backgroundColor: Colors.green,
      ),
      body:BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Best"
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
      )
    );
  }
}