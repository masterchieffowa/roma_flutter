import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oneminuteclinic/MainScreens/HomeScreen/HomeScreen.dart';
import 'package:oneminuteclinic/Models/AppointmentModel.dart';
import 'package:oneminuteclinic/Shared/Components/AppoitnemtsList.dart';
// 0xffF7F6F8
// 0xff313B49

Widget dateListItem(AppointmentsList, int index){
  return Container(
  width: double.infinity,
  height: 160,
  decoration: BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(25),
  ),
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.person_2_outlined,
                color: Colors.teal,
              ),
            ),
            // TODO: expanded widget and overflow text,
            Expanded(
              child: Text(
                'Appointment with ${
                    // ignore: unnecessary_null_comparison
                    AppointmentsList[index]['doctorName'] ?? 'Doctor Name'
                }',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const SizedBox(
              width: 0,
            ),
            GestureDetector(
              child: const Icon(Icons.more_vert,
                color: Colors.grey,
              ),
              onTap: (){
                print('more');
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.date_range_outlined,
                color: Colors.teal,
              ),
            ),
            Text(
              AppointmentsList[index]['date'],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const Text(
              '',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.access_time_outlined,
                color: Colors.teal,
              ),
            ),
            Text(
              AppointmentsList[index]['time'],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const Text(
              ' to ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const Text(
              '11:00 AM',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    ),
  ),
);
}

class CheckTurn extends StatefulWidget {
  const CheckTurn({Key? key}) : super(key: key);

  @override
  State<CheckTurn> createState() => _CheckTurnState();
}

class _CheckTurnState extends State<CheckTurn> {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // CollectionReference users = FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).collection("Appointment");
  // // get tha data from firebase
  // Future<void> getData() async {
  //   for (int i = 0; i < 5; i++) {
  //     await users.doc(i.toString()).get().then((DocumentSnapshot documentSnapshot) {
  //       if (documentSnapshot.exists) {
  //         print('Document data: ${documentSnapshot.data()}');
  //       } else {
  //         print('Document does not exist on the database');
  //       }
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Check Turn',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
      child: AppointmentsList.isEmpty?
      Column(
        children: const <Widget>[
          SizedBox(
            height: 50,
          ),
          Center(
            child: Image(
              image: AssetImage('assets/images/No Notication.png'),
              height: 200,
              width: 200,
            ),
          ),
          Align(
            alignment: Alignment(-0.007, 1.0),
            child: SizedBox(
              height: 33.0,
              child: Text(
                'No appointments yet',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 25,
                  color: Color(0xff8f8f8f),
                  fontWeight: FontWeight.w500,
                ),
                softWrap: false,
              ),
            ),
          ),
        ],
      ) :
      SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => dateListItem(AppointmentsList, index),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: AppointmentsList.length,
              ),
            )
          ),
        ),
      ),

    ));
  }
}
