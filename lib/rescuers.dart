import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class RescueAgency {
  final String name;
  final String phoneNumber;
  final String address;

  RescueAgency({
    required this.name,
    required this.phoneNumber,
    required this.address,
  });
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue, // Change to your desired primary color
        hintColor: Colors.green, // Change to your desired accent color
      ),
      home: RescuePage(prefs: prefs),
    );
  }
}

class RescuePage extends StatefulWidget {
  final SharedPreferences prefs;

  const RescuePage({super.key, required this.prefs});

  @override
  // ignore: library_private_types_in_public_api
  _RescuePageState createState() => _RescuePageState();
}

class _RescuePageState extends State<RescuePage> {
  final List<RescueAgency> rescueAgencies = [];

  @override
  void initState() {
    super.initState();
    loadSavedData();
  }

  Future<void> loadSavedData() async {
    final List<String>? savedData = widget.prefs.getStringList('rescueAgencies');
    if (savedData != null) {
      setState(() {
        rescueAgencies.clear();
        for (String data in savedData) {
          final List<String> parts = data.split(',');
          if (parts.length == 3) {
            final agency = RescueAgency(
              name: parts[0],
              phoneNumber: parts[1],
              address: parts[2],
            );
            rescueAgencies.add(agency);
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rescue Agencies'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: rescueAgencies.length,
              itemBuilder: (context, index) {
                final agency = rescueAgencies[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(agency.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Phone: ${agency.phoneNumber}'),
                        Text('Address: ${agency.address}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddRescueAgencyScreen(
                rescueAgencies: rescueAgencies,
                prefs: widget.prefs,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddRescueAgencyScreen extends StatelessWidget {
  final List<RescueAgency> rescueAgencies;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final SharedPreferences prefs;

  AddRescueAgencyScreen({super.key, 
    required this.rescueAgencies,
    required this.prefs,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Rescue Agency'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name of Service'),
            ),
            TextFormField(
              controller: phoneNumberController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            ElevatedButton(
              onPressed: () {
                final agency = RescueAgency(
                  name: nameController.text,
                  phoneNumber: phoneNumberController.text,
                  address: addressController.text,
                );
                rescueAgencies.add(agency);

                // Clear the input fields
                nameController.clear();
                phoneNumberController.clear();
                addressController.clear();

                // Save the updated data
                saveData();

                Navigator.pop(context); // Return to the main screen
              },
              child: const Text('Add Rescue Agency'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveData() async {
    final List<String> dataToSave = rescueAgencies.map((agency) {
      return '${agency.name},${agency.phoneNumber},${agency.address}';
    }).toList();

    await prefs.setStringList('rescueAgencies', dataToSave);
  }
}
