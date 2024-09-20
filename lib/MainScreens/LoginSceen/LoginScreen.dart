import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oneminuteclinic/MainScreens/NavigationBar/NavigationBar.dart';
import 'package:oneminuteclinic/Shared/Components/defaultTextFeild.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: const Color(0xffF7F6F8),
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
                  "Login",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
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
                      if (value!.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Email Must Not Be Empty"),
                            ),
                        );
                        return "Email Must Not Be Empty";
                      }
                    },
                    onSubmit: (value) {},
                    onChange: (value) {},
                    suffixPressed: () {},
                    prefix: Icons.email,
                    isPassword: false,
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
                      if (value!.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Password Must Not Be Empty"),
                          ),
                        );
                        return "Password Must Not Be Empty";
                      }
                    },
                    onSubmit: (value) {},
                    onChange: (value) {},
                    suffix: passwordVisible? const Icon(Icons.visibility): const Icon(Icons.visibility_off),
                    suffixPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    prefix: Icons.lock,
                    isPassword: passwordVisible,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Forget Password?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: defaultButton(
                      text: "Login".toUpperCase(),
                      height: 50,
                      // width: "Login".toString().length.toDouble() * 10 + 20,
                      width: 150,
                      function: () {
                        setState(() {
                          if (formKey.currentState!.validate()) {
                            print("mail.text");
                            print("password.text");
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: mail.text, password: password.text)
                                .then((value) {

                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const MainNavigationBar();
                              }));

                            }).catchError((error) {
                              print("Login Error");
                              print(error.toString());
                              print(error.printError());
                            });
                          }
                        });
                      },
                    ),
                ),
                const SizedBox(
                  height: 170
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
