import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AccountProfile extends StatefulWidget {
  const AccountProfile({Key? key}) : super(key: key);

  @override
  State<AccountProfile> createState() => _AccountProfileState();
}

ImageProvider _imageFile = const AssetImage('assets/images/Profile.png');
final _picker = ImagePicker();

class _AccountProfileState extends State<AccountProfile> {


  Future<void> _getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imageFile = FileImage(File(pickedFile.path));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffF7F6F8),
          title: const Text(
            "Profile",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          color: const Color(0xffF7F6F8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Stack(
                //   children: [
                //     Container(
                //       height: 100,
                //       width: 100,
                //       decoration: BoxDecoration(
                //         color: Colors.grey,
                //         shape: BoxShape.circle,
                //         image: DecorationImage(
                //           image: image != null ? FileImage(image!) : const AssetImage("assets/images/Profile.png"), // use null-aware operator to conditionally set image property
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //     ),
                //     Positioned(
                //       bottom: 0,
                //       right: 0,
                //       child: GestureDetector(
                //         child: Container(
                //           height: 35,
                //           width: 35,
                //           decoration: const BoxDecoration(
                //             shape: BoxShape.circle,
                //             color: Colors.teal,
                //           ),
                //           child: const Icon(
                //             Icons.camera_alt,
                //             color: Colors.white,
                //           ),
                //         ),
                //         onTap: (){
                //           getImage();
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  // height: MediaQuery.of(context).size.height * 0.2,
                  height: 180,
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Container(
                        // margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 140,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          // borderRadius: BorderRadiusDirectional.only(
                          //   bottomStart: Radius.circular(35),
                          //   bottomEnd: Radius.circular(35),
                          // ),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey,
                          //     blurRadius: 5,
                          //     offset: Offset(0, 3),
                          //   ),
                          // ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: CircleAvatar(
                          radius: 65,
                          backgroundColor: Colors.white,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundImage: _imageFile != null ? _imageFile : const AssetImage("assets/images/Profile.png"),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.grey[300],
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.teal,
                                    ),
                                    onPressed: () async {
                                      _getImage();
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Name:'),
                          const SizedBox(height: 3,),
                          Row(
                            children: const [
                              Expanded(
                                child: Text('Mahmoud Adel',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(Icons.person,
                                size: 30,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height:1,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Phone:'),
                          const SizedBox(height: 3,),
                          Row(
                            children: const [
                              Expanded(
                                child: Text('+201009825340',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(Icons.phone_android,
                                size: 30,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height:1,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Email:'),
                          const SizedBox(height: 3,),
                          Row(
                            children: const [
                              Expanded(
                                child: Text('mahmmoudadel607@gmail.com@gmail.com',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(Icons.mail,
                                size: 30,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height:1,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Address:'),
                          const SizedBox(height: 3,),
                          Row(
                            children: const [
                              Expanded(
                                child: Text('16 st Elmandara, Alexandria, Egypt',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(Icons.location_on_outlined,
                                size: 30,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height:1,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Password:'),
                          const SizedBox(height: 3,),
                          Row(
                            children: const [
                              Expanded(
                                // child: Text('that\'s my password',
                                child: Text("*********",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              Icon(Icons.remove_red_eye,
                                size: 30,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height:1,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: GestureDetector(
                          child: Container(
                            height: 50,
                            width: "Book Appointment".length * 10.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.teal,
                            ),
                            child: const Center(
                              child: Text(
                                'Update',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          onTap: (){
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
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      // const Text(
                      //   "John Doe",
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   margin: const EdgeInsets.only(top: 20),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: const [
                      //       Text(
                      //         "Đăng xuất",
                      //         style: TextStyle(
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
