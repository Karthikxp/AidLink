import 'package:aidlinkrev2/rescuers.dart';
import 'package:flutter/material.dart';
import 'map.dart'; // Import the map.dart file

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavigationExample(),
      //theme: ThemeData(
        //useMaterial3: true,
        //primaryColor: Colors.black
      //),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.grey,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.map),
            icon: Icon(Icons.map_outlined),
            label: 'Map',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.light),
            icon: Icon(Icons.light_outlined),
            label: 'Emergency',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.school),
            icon: Icon(Icons.school_outlined),
            label: 'Rescuers',
          ),
        ],
      ),
      body: <Widget>[
        currentPageIndex == 0
            ? MapPage() // Show the MapPage when "Map" button is selected
            : Container(
                color: Colors.green,
                alignment: Alignment.center,
                child: const Text('Page 1'),
              ),
        currentPageIndex == 1
              ? RescuePage()
              : Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: const Text('Page 2'),
              ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
      ][currentPageIndex],
    );
  }
}
