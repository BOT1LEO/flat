import 'package:flutter/material.dart';
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
        child: Text("No data yet!"),
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