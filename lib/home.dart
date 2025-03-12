import 'package:aidlinkrev2/emergency.dart';
import 'package:aidlinkrev2/map.dart';
import 'package:flutter/material.dart';
import 'package:aidlinkrev2/rescuers.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(NavigationBarApp(prefs: prefs));
}

class NavigationBarApp extends StatelessWidget {
  final SharedPreferences prefs;

  const NavigationBarApp({required this.prefs, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigationExample(prefs: prefs),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
      ),
    );
  }
}

class NavigationExample extends StatefulWidget {
  final SharedPreferences prefs;

  const NavigationExample({required this.prefs, Key? key}) : super(key: key);

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
            selectedIcon: Icon(Icons.group_add),
            icon: Icon(Icons.group_add_outlined),
            label: 'Rescuers',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.add_alert),
            icon: Icon(Icons.add_alert_outlined),
            label: 'Emergency',
          ),
        ],
      ),
      body: <Widget>[
        currentPageIndex == 0
            ? MapPage()
            : Container(
                        color: Colors.red,
                        alignment: Alignment.center,
                        child: const Text('Page 1'),
                      ),
        currentPageIndex == 1
              ? RescuePage(prefs: widget.prefs) // Pass prefs to RescuePage
              : Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: const Text('Page 2'),
              ),
        currentPageIndex == 2
        ? EmergencyPage()
        : Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
      ][currentPageIndex],
    );
  }
}
