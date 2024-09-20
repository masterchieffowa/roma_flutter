import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oneminuteclinic/MainScreens/LoginSceen/LoginScreen.dart';
import 'package:oneminuteclinic/Models/UserModel.dart';
import 'package:oneminuteclinic/Shared/Components/defaultTextFeild.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController ID = TextEditingController();
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffF7F6F8),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Center(
                  child: Image(
                    image: AssetImage("assets/images/MainLogo.png"),
                    width: 200,
                    height: 200,
                  ),
                ),
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultTextFeild(
                    controller: name,
                    type: TextInputType.name,
                    label: "Name",
                    hint: "Enter Your Name",
                    validate: (value) {
                      if (value==null || value.isEmpty) {
                        return "Name Must Not Be Empty";
                      }
                      return null;
                    },
                    onSubmit: (value) {},
                    onChange: (value) {},
                    prefix: Icons.person,
                    suffixPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultTextFeild(
                    controller: mail,
                    type: TextInputType.emailAddress,
                    label: "Email",
                    hint: "Enter Your Email",
                    validate: (value) {
                      if (value==null || value.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Email Must Not Be Empty"),
                          ),
                        );
                        return "Email Must Not Be Empty";
                      }
                      return null;
                    },
                    onSubmit: (value) {},
                    onChange: (value) {},
                    prefix: Icons.email,
                    suffixPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultTextFeild(
                    controller: password,
                    type: TextInputType.visiblePassword,
                    label: "Password",
                    hint: "Enter Your Password",
                    validate: (value) {
                      if (value==null || value !.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Password Must Not Be Empty"),
                          ),
                        );
                        return "Password Must Not Be Empty";
                      }
                      return null;
                    },
                    onSubmit: (value) {},
                    onChange: (value) {},
                    prefix: Icons.lock,
                    suffix: passwordVisible? const Icon(Icons.visibility): const Icon(Icons.visibility_off),
                    suffixPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    isPassword: passwordVisible,
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultTextFeild(
                    controller: phone,
                    type: TextInputType.phone,
                    label: "Phone",
                    hint: "Enter Your Phone",
                    validate: (value) {
                      if (value==null || value.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Phone Must Not Be Empty"),
                          ),
                        );
                        return "Phone Must Not Be Empty";
                      }
                      return null;
                    },
                    onSubmit: (value) {},
                    onChange: (value) {},
                    prefix: Icons.phone,
                    suffixPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultTextFeild(
                    controller: ID,
                    type: TextInputType.number,
                    label: "ID",
                    hint: "Enter Your ID",
                    validate: (value) {
                      if (value==null || value.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("ID Must Not Be Empty"),
                          ),
                        );
                        return "ID Must Not Be Empty";
                      }
                      return null;
                    },
                    onSubmit: (value) {},
                    onChange: (value) {},
                    prefix: Icons.perm_identity,
                    suffixPressed: () {},
                ),

                const SizedBox(
                  height: 20,
                ),
                Center (
                  child: defaultButton(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: mail.text,
                            password: password.text,
                          )
                              .then((value) {

                            UserModel userModel = UserModel(
                              name: name.text,
                              email: mail.text,
                              password: password.text,
                              phone: phone.text,
                              id: ID.text,
                              isEmailVerified: true,
                            );

                            FirebaseFirestore.instance
                                .collection("Users")
                                .doc(FirebaseAuth.instance.currentUser!.uid).set(
                              userModel.toMap(),
                            ).then((value) {
                              print("User Added");
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("User Added Successfully"),
                                ),
                              );
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> LoginScreen()));
                            })
                                .catchError((error) {
                              print(error.toString());
                            });
                          })
                              .catchError((error) { print(error.toString());
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please Fill The Required Fields"),
                            ),
                          );
                        }
                      },
                      text: "Sign Up",
                      height: 50,
                      width: 150,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already Have An Account?",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> LoginScreen()));
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
