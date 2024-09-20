import 'package:flutter/material.dart';

class settings extends StatefulWidget {

  @override
  State<settings> createState() => _settings();
}

class _settings extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffF7F6F8),
          title: const Text(
            "Settings",
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
          child: Column(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 3,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Icon(Icons.notifications_none,
                                size: 25,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 10,),
                              const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 1.0),
                                  child: Text('Notifications',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.teal[400],
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                // child: const CircleAvatar(
                                //   backgroundColor: Colors.grey,
                                // ),
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                      child: Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey[200],
                                          // borderRadius: BorderRadius.circular(25)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height:1,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 3,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Icon(Icons.dark_mode_sharp,
                                size: 25,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 10,),
                              const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 1.0),
                                  child: Text('Dark Mode',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                // child: const CircleAvatar(
                                //   backgroundColor: Colors.grey,
                                // ),
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                      child: Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey[200],
                                          // borderRadius: BorderRadius.circular(25)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height:1,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 3,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(Icons.lock_reset_sharp,
                                size: 25,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 1.0),
                                  child: Text('Change Password',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height:1,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 3,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(Icons.account_circle_outlined,
                                size: 25,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 1.0),
                                  child: Text('Change Account',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height:1,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 3,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(Icons.help_outline_sharp,
                                size: 25,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 1.0),
                                  child: Text('Help and Support',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height:1,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 3,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                               Icon(Icons.logout,
                                size: 25,
                                color: Colors.red[500],
                              ),
                              const SizedBox(width: 10,),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 1.0),
                                  child: Text('Log out',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red[500]
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height:1,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                    ],
                  ),
                ),
              ),
              Expanded(child: Container())
            ],
          ),
        ),
      ),
    );
  }
}
