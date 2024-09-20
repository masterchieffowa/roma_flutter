import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AddAppointment extends StatefulWidget {
  const AddAppointment({Key? key}) : super(key: key);

  @override
  State<AddAppointment> createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // toolbarHeight: 80,
          elevation: 0.0,
          backgroundColor: Colors.teal,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Add Appointment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.calendar_month_outlined),
            ],
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 50),
              // child: Icon(Icons.more_vert),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: const Color(0xffF7F6F8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  // Appointment Date
                  const Text(
                    'Appointment Date',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blueGrey[50],
                      // border: Border(
                      //   bottom: BorderSide(
                      //     color: Colors.black,
                      //     width: 1,
                      //   ),
                      // ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20,top: 2),
                      child: TextFormField(
                        cursorColor: Colors.black38, // Set the cursor color
                        controller: _dateController,
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(bottom: 2.0, left: 20),
                            child: Icon(Icons.calendar_month_outlined),
                          ),
                          border: InputBorder.none,
                          suffixIconColor: Colors.black38,
                          hintText: 'yyyy/mm/dd',
                          hintStyle: TextStyle(
                            // color: Color.fromRGBO(0, 0, 0, 0.38),
                            color: Colors.black38,
                          ),
                        ),
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2025),
                            // initialEntryMode: DatePickerEntryMode.calendar,
                          );
                          if (date != null) {
                            setState(() {
                              _dateController.text =
                                  DateFormat('yyyy/MM/dd').format(date);
                              // date.
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Appointment Time
                  const Text(
                    'Expected Arrival Time',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blueGrey[50],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20,top: 2),
                      child: TextFormField(
                        cursorColor: Colors.black38, // Set the cursor color
                        controller: _timeController,
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(bottom: 2.0, left: 20),
                            child: Icon(Icons.watch_later_outlined),
                          ),
                          border: InputBorder.none,
                          suffixIconColor: Colors.black38,
                          hintText: 'hh:mm',
                          hintStyle: TextStyle(
                            // color: Color.fromRGBO(0, 0, 0, 0.38),
                            color: Colors.black38,
                          ),
                        ),
                        onTap: () async {
                          TimeOfDay? time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (time != null) {
                            setState(() {
                              _timeController.text =
                                  time.format(context);
                              // date.
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Appointment Reason
                  const Text(
                    'Appointment Reason',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blueGrey[50],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20,top: 2),
                      child: TextFormField(
                        cursorColor: Colors.black38, // Set the cursor color
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                        controller: _reasonController,
                        decoration: const InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(bottom: 55.0, left: 20),
                            child: Icon(Icons.edit_note_sharp),
                          ),
                          border: InputBorder.none,
                          suffixIconColor: Colors.black38,
                          hintText: 'Reason',
                          hintStyle: TextStyle(
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 160,
                  ),
                  // Book Appointment Button
                  Center(
                    child: GestureDetector(
                      child: Container(
                        height: 50,
                        width: "Book Appointment".length * 10.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.teal,
                        ),
                        child:  const Center(
                          child: Text(
                            'Book ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      onTap: () async{
                        // final UserData = FirebaseFirestore.instance.collection("Users").doc("1020305559563").get();
                        // final myCollection = FirebaseFirestore.instance.collection('myCollection');
                        // // var UserData = UserModel().getUserData();
                        // // AppointmentModel(
                        // //     id: _dateController.text+_timeController.text,
                        // //     name:
                        // //     date: _dateController.text,
                        // //     time: time,
                        // //     description: description,
                        // //     status: status,
                        // //     patientId: patientId,
                        // //     doctorId: doctorId,
                        // //     patientName: patientName,
                        // //     doctorName: doctorName,
                        // // );
                        // // Get the data from a document
                        // UserData.then((doc) {
                        //   if (doc.exists) {
                        //     print("Document data: ${doc.data()}");
                        //   } else {
                        //     print("No such document!");
                        //   }
                        // }).catchError((error) {
                        //   print("Error getting document: $error");
                        // });
                        print("--------------------------------------------");
                        print(FirebaseAuth.instance.currentUser!.uid);
                        // TODO: this is the code to add the appointment to the database from ChatGPT
                        final userDataSnapshot = await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).get();
                        // FirebaseAuth.instance.currentUser!.uid;
                        if (userDataSnapshot.exists) {
                          final userData = userDataSnapshot.data();
                          print("User data: $userData");
                          print("User ID: ${FirebaseAuth.instance.currentUser!.uid}");

                          FirebaseFirestore.instance.collection("Appointment").doc(FirebaseAuth.instance.currentUser!.uid).set({
                            "id": userData!['id'] + _dateController.text + _timeController.text,
                            "name": userData!['name'],
                            "date": _dateController.text,
                            "time": _timeController.text,
                            "description": _reasonController.text,
                            "status": "Old",
                            "patientId": userData!['id'],
                            "doctorId": "mahmoudadel607",
                            "patientName": userData!['name'],
                            "doctorName": "Mahmoud Adel",
                          });

                          FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("Appointment").doc().set({
                            "id": userData!['id'] + _dateController.text + _timeController.text,
                            "name": userData!['name'],
                            "date": _dateController.text,
                            "time": _timeController.text,
                            "description": _reasonController.text,
                            "status": "Old",
                            "patientId": userData!['id'],
                            "doctorId": "mahmoudadel607",
                            "patientName": userData!['name'],
                            "doctorName": "Mahmoud Adel",
                          });
                        } else {
                          print("User data not found!");
                        }
                        Navigator.pop(context);

                        // myCollection.get().then((querySnapshot) {
                        //   querySnapshot.docs.forEach((doc) {
                        //     print(doc.id + " => " + doc.data().toString());
                        //   });
                        // }).catchError((error) {
                        //   print("Error getting documents: $error");
                        // });
                        // FutureBuilder<DocumentSnapshot>(
                        //     future: myCollection.doc('1020305559563').get(),
                        //     builder: (context, snapshot) {
                        //       if (snapshot.connectionState == ConnectionState.done) {
                        //         if (snapshot.hasError) {
                        //           return Text('Error: ${snapshot.error}');
                        //         }
                        //         final myData = snapshot.data?.data();
                        //         print("Hello Mahmoud here is the data $myData");
                        //         return Text('My data: $myData');
                        //       } else {
                        //         return const CircularProgressIndicator();
                        //       }
                        //     }
                        //     );

                        // print("Hello Mahmoud $UserData");
                        // FirebaseFirestore.instance.collection("Appointment").doc("mahmoud_adel").set({
                        //   "id": 'mahmoud_adel',
                        //   "name": UserData['name'],
                        //   "date": _dateController.text,
                        //   "time": _timeController.text,
                        //   "description": "New Appointment",
                        //   "status": "Old",
                        //   "patientId": "302010",
                        //   "doctorId": "102030",
                        //   "patientName": "Mohammed Mahmoud",
                        //   "doctorName": "Mahmoud Ahmed",
                        // });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Book Appointment Done'),
                            duration: Duration(seconds: 2),
                            // action: SnackBarAction(
                            //   label: 'BOOK NOW',
                            //   onPressed: () {
                            //     // Add code here to handle the action
                            //   },
                            // ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
