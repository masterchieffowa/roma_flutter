// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade900),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       drawer: Drawer(
//         // Add a ListView to the drawer. This ensures the user can scroll
//         // through the options in the drawer if there isn't enough vertical
//         // space to fit everything.
//         child: ListView(
//           // Important: Remove any padding from the ListView.
//           padding: EdgeInsets.zero,
//           children: [
//              DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.teal.shade800,
//               ),
//               child: Text('Drawer Header'),
//             ),
//             ListTile(
//               title: const Text('Item 1'),
//               onTap: () {
//                 // Update the state of the app.
//                 // ...
//               },
//             ),
//             ListTile(
//               title: const Text('Item 2'),
//               onTap: () {
//                 // Update the state of the app.
//                 // ...
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
// TODO: ===================================
// import 'package:flutter/material.dart';
// import 'Database/database_helper.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SQLite Example',
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final TextEditingController _patient_name = TextEditingController();
//   final TextEditingController _patient_phone = TextEditingController();
//   final TextEditingController _patient_gender = TextEditingController();
//   final TextEditingController _patient_address = TextEditingController();
//   final TextEditingController _patient_maritalStatus = TextEditingController();
//   final TextEditingController _patient_job = TextEditingController();
//   final DatabaseHelper _databaseHelper = DatabaseHelper();
//   List<Map<String, dynamic>> _items = [];
//
//   void _insertItem() async {
//     if (_patient_name.text.isNotEmpty) {
//       await _databaseHelper.insertPatient(_patient_name.text, _patient_phone.text, _patient_gender.text, _patient_address.text, _patient_maritalStatus.text, _patient_job.text);
//       _patient_name.clear();
//       _patient_phone.clear();
//       _patient_gender.clear();
//       _patient_address.clear();
//       _patient_maritalStatus.clear();
//       _patient_job.clear();
//       // _getItems();
//     }
//   }
//
//   void _getItems() async {
//     final items = await _databaseHelper.getPatients();
//     setState(() {
//       _items = items;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeDatabase();
//   }
//
//   void _initializeDatabase() async {
//     await _databaseHelper.initDatabase();
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('SQLite Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               flex: 3,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     TextField(
//                       controller: _patient_name,
//                       decoration: const InputDecoration(
//                         labelText: 'Enter item name',
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     TextField(
//                       controller: _patient_phone,
//                       decoration: const InputDecoration(
//                         labelText: 'Enter item phone',
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     TextField(
//                       controller: _patient_gender,
//                       decoration: const InputDecoration(
//                         labelText: 'Enter item gender',
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     TextField(
//                       controller: _patient_address,
//                       decoration: const InputDecoration(
//                         labelText: 'Enter item address',
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     TextField(
//                       controller: _patient_maritalStatus,
//                       decoration: const InputDecoration(
//                         labelText: 'Enter item marital status',
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     TextField(
//                       controller: _patient_job,
//                       decoration: const InputDecoration(
//                         labelText: 'Enter item job',
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: _insertItem,
//               child: const Text('Add Item'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _getItems,
//               child: const Text('Get Items'),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _items.length,
//                 itemBuilder: (context, index) {
//                   print("_items: ==");
//                   print(_items);
//                   return const ListTile(
//                     title: Text("_items"),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//TODO:==============================
// import 'package:flutter/material.dart';
// import 'Database/database_helper.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SQLite Example',
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final TextEditingController _patientNameController = TextEditingController();
//   final TextEditingController _patientPhoneController = TextEditingController();
//   final TextEditingController _patientGenderController = TextEditingController();
//   final TextEditingController _patientAddressController = TextEditingController();
//   final TextEditingController _patientMaritalStatusController = TextEditingController();
//   final TextEditingController _patientJobController = TextEditingController();
//   final DatabaseHelper _databaseHelper = DatabaseHelper();
//   List<Map<String, dynamic>> _patients = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeDatabase();
//   }
//
//   @override
//   void dispose() {
//     // Dispose of the TextEditingController to free resources and avoid memory leaks
//     _patientNameController.dispose();
//     _patientPhoneController.dispose();
//     _patientGenderController.dispose();
//     _patientAddressController.dispose();
//     _patientMaritalStatusController.dispose();
//     _patientJobController.dispose();
//     super.dispose();
//   }
//
//   void _initializeDatabase() async {
//     await _databaseHelper.initDatabase();
//     _getPatients();  // Fetch patients after initializing the database
//   }
//
//   Future<void> _insertPatient() async {
//     if (_validateInput()) {
//       await _databaseHelper.insertPatient(
//         _patientNameController.text,
//         _patientPhoneController.text,
//         _patientGenderController.text,
//         _patientAddressController.text,
//         _patientMaritalStatusController.text,
//         _patientJobController.text,
//       );
//       _clearInputs();  // Clear input fields after inserting the patient
//       _getPatients();  // Refresh the patient list
//     }
//   }
//
//   bool _validateInput() {
//     if (_patientNameController.text.isEmpty ||
//         _patientPhoneController.text.isEmpty ||
//         _patientGenderController.text.isEmpty ||
//         _patientAddressController.text.isEmpty ||
//         _patientMaritalStatusController.text.isEmpty ||
//         _patientJobController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Please fill out all fields")),
//       );
//       return false;
//     }
//     return true;
//   }
//
//   void _clearInputs() {
//     _patientNameController.clear();
//     _patientPhoneController.clear();
//     _patientGenderController.clear();
//     _patientAddressController.clear();
//     _patientMaritalStatusController.clear();
//     _patientJobController.clear();
//   }
//
//   Future<void> _getPatients() async {
//     final patients = await _databaseHelper.getPatients();
//     setState(() {
//       _patients = patients;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SQLite Patient Records'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             _buildInputForm(),
//             SizedBox(height: 16.0),
//             Expanded(
//               child: _patients.isEmpty
//                   ? Center(child: Text('No patients found'))
//                   : ListView.builder(
//                 itemCount: _patients.length,
//                 itemBuilder: (context, index) {
//                   final patient = _patients[index];
//                   return ListTile(
//                     title: Text(patient['name']),
//                     subtitle: Text('Phone: ${patient['phone']}, Gender: ${patient['gender']}'),
//                     trailing: Text(patient['job']),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _insertPatient,
//         tooltip: 'Add Patient',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
//
//   Widget _buildInputForm() {
//     return Column(
//       children: [
//         _buildTextField(_patientNameController, 'Patient Name'),
//         _buildTextField(_patientPhoneController, 'Phone Number'),
//         _buildTextField(_patientGenderController, 'Gender'),
//         _buildTextField(_patientAddressController, 'Address'),
//         _buildTextField(_patientMaritalStatusController, 'Marital Status'),
//         _buildTextField(_patientJobController, 'Job'),
//       ],
//     );
//   }
//
//   Widget _buildTextField(TextEditingController controller, String label) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }
//TODO:=========================
import 'package:flutter/material.dart';
import 'Database/database_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _patientPhoneController = TextEditingController();
  final TextEditingController _patientGenderController = TextEditingController();
  final TextEditingController _patientAddressController = TextEditingController();
  final TextEditingController _patientMaritalStatusController = TextEditingController();
  final TextEditingController _patientJobController = TextEditingController();

  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Map<String, dynamic>> _patients = [];

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  @override
  void dispose() {
    // Dispose of the TextEditingController to free resources and avoid memory leaks
    _patientNameController.dispose();
    _patientPhoneController.dispose();
    _patientGenderController.dispose();
    _patientAddressController.dispose();
    _patientMaritalStatusController.dispose();
    _patientJobController.dispose();
    super.dispose();
  }

  void _initializeDatabase() async {
    await _databaseHelper.initDatabase();
    _getPatients();  // Fetch patients after initializing the database
  }

  Future<void> _insertPatient() async {
    if (_validateInput()) {
      await _databaseHelper.insertPatient(
        _patientNameController.text,
        _patientPhoneController.text,
        _patientGenderController.text,
        _patientAddressController.text,
        _patientMaritalStatusController.text,
        _patientJobController.text,
      );
      _clearInputs();  // Clear input fields after inserting the patient
      _getPatients();  // Refresh the patient list
    }
  }

  bool _validateInput() {
    if (_patientNameController.text.isEmpty ||
        _patientPhoneController.text.isEmpty ||
        _patientGenderController.text.isEmpty ||
        _patientAddressController.text.isEmpty ||
        _patientMaritalStatusController.text.isEmpty ||
        _patientJobController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill out all fields")),
      );
      return false;
    }
    return true;
  }

  void _clearInputs() {
    _patientNameController.clear();
    _patientPhoneController.clear();
    _patientGenderController.clear();
    _patientAddressController.clear();
    _patientMaritalStatusController.clear();
    _patientJobController.clear();
  }

  Future<void> _getPatients() async {
    final patients = await _databaseHelper.getPatients();
    setState(() {
      _patients = patients;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildTextField(_patientNameController, 'Enter patient name'),
                    const SizedBox(height: 20),
                    _buildTextField(_patientPhoneController, 'Enter patient phone'),
                    const SizedBox(height: 20),
                    _buildTextField(_patientGenderController, 'Enter patient gender'),
                    const SizedBox(height: 20),
                    _buildTextField(_patientAddressController, 'Enter patient address'),
                    const SizedBox(height: 20),
                    _buildTextField(_patientMaritalStatusController, 'Enter marital status'),
                    const SizedBox(height: 20),
                    _buildTextField(_patientJobController, 'Enter patient job'),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _insertPatient,
              child: const Text('Add Patient'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getPatients,
              child: const Text('Get Patients'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _patients.isEmpty
                  ? Center(child: Text('No patients found'))
                  : ListView.builder(
                itemCount: _patients.length,
                itemBuilder: (context, index) {
                  final patient = _patients[index];
                  return ListTile(
                    title: Text(patient['name']),
                    subtitle: Text('Phone: ${patient['phone']}'),
                    trailing: Text(patient['gender']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
