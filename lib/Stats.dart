import 'package:flat/exercise.dart';
import 'package:flutter/material.dart';
class Stats extends StatefulWidget {
  Exercise value;
  Stats({key,required this.value});
  @override
  State<Stats> createState() => _StatsState(value: value);
}

class _StatsState extends State<Stats> {
  int selectedIndex = 0;
  Exercise value;
  _StatsState({required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(value.name),
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
        child: Column(
          children: [

          ],
        )
      );
  }

  static Widget settings(){
    //todo settings
    return Center(
      child: Column(
        children: [

        ],
      )
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
}