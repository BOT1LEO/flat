
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
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            child: ElevatedButton(
              child: const Text("Pushup"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Stats(value: "Pushups")));
              } 
              ),
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
  int selectedIndex = 0;
  String value = "";
  _StatsState({required this.value});

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
    ),
    Text(
      'Graph',
    ),
    Text(
      'Settings',
    ),
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
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      )
    );
  }
}