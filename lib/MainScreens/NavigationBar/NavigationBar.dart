import 'package:flutter/material.dart';
import 'package:oneminuteclinic/MainScreens/HomeScreen/HomeScreen.dart';
import 'package:oneminuteclinic/MainScreens/NavigationBar/Drawer/AccountProfile/AccountProfile.dart';
import 'package:oneminuteclinic/MainScreens/NavigationBar/Drawer/settings/settings.dart';
import 'package:oneminuteclinic/MainScreens/QuantumDevice/QuantumScreen.dart';
import 'package:oneminuteclinic/MainScreens/ResultAnaluysis/ResultAnalysis.dart';
import 'package:oneminuteclinic/Models/SVGIcon.dart';

class MainNavigationBar extends StatefulWidget {
  const MainNavigationBar({Key? key}) : super(key: key);

  @override
  State<MainNavigationBar> createState() => _MainNavigationBar();
}
int _currentIndex = 0;
List<Widget> MainScreens = <Widget>[
  const HomeScreen(),
  const QuantumDevice(),
  const ResultAnalysis(),
];

class _MainNavigationBar extends State<MainNavigationBar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    backgroundColor: const Color(0xffF7F6F8),
    elevation: 0.0,
    leading: Builder(
      builder: (context) => IconButton(
        icon: const Icon(
          Icons.menu,
          color: Color(0xff313B49),
          size: 27,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    ),
    title: const Text(
      'One Minute Clinic',
      // textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xff27A1A0),
        fontSize: 25,
        fontFamily: 'Segoe UI',
      ),
      textAlign: TextAlign.center,
    ),
    centerTitle: true,
    actions: [
      Container(
        padding: const EdgeInsets.only(right: 15),
        child: Row(
          children: const [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://scontent.faly8-2.fna.fbcdn.net/v/t1.6435-9/90815621_1083153172045674_2002579504496640000_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=5Dcyl87KKoAAX_nhFX8&_nc_ht=scontent.faly8-2.fna&oh=00_AfAKwnuTHS_3sBEeLzkBOdDlq4PZmBKq8njtr8nmAP0FvA&oe=64739E33',
              ),
              backgroundColor: Color(0xffEBEBEB),
            ),
          ],
        ),
      ),
    ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Mahmoud Adel"),
              accountEmail: Text("mahmmoudadel607@gmail.com",
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image(
                    image: NetworkImage(
                      'https://scontent.faly8-2.fna.fbcdn.net/v/t1.6435-9/90815621_1083153172045674_2002579504496640000_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=5Dcyl87KKoAAX_nhFX8&_nc_ht=scontent.faly8-2.fna&oh=00_AfAKwnuTHS_3sBEeLzkBOdDlq4PZmBKq8njtr8nmAP0FvA&oe=64739E33',
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(
                  'Account'
              ),
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const AccountProfile())),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(
                  'Settings'
              ),
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> settings())),
            ),
            ListTile(
              leading: const Icon(Icons.share_sharp),
              title: const Text(
                  'Share'
              ),
              onTap: ()=> print("sharing"),
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text(
                  'Payment'
              ),
              onTap: ()=> print("Payment"),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(
                color: Colors.grey,
                height: 5,
              ),
            ),
            const ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                  'Log Out'
              ),
              // onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>login())),
            ),
            ListTile(
              leading: const Icon(Icons.help_outline_outlined),
              title: const Text(
                  'About us'
              ),
              onTap: ()=> print('Contact us'),
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffF7F6F8),
        selectedItemColor: const Color(0xFF27A1A0),
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(color: Color(0xFF27A1A0)),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items:  [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1?
            const SvgIcon(
              assetName:
              '<svg viewBox="193.0 863.0 27.0 27.0" ><path transform="translate(188.5, 858.5)" d="M 25.5 24 L 19.5 18 L 19.5 13.22999954223633 C 21.23999977111816 12.60000038146973 22.5 10.94999980926514 22.5 9 C 22.5 6.510000228881836 20.48999977111816 4.5 18 4.5 C 15.51000022888184 4.5 13.5 6.510000228881836 13.5 9 C 13.5 10.94999980926514 14.76000022888184 12.60000038146973 16.5 13.22999954223633 L 16.5 18 L 10.5 24 L 4.5 24 L 4.5 31.5 L 12 31.5 L 12 26.92499923706055 L 18 20.625 L 24 26.92499923706055 L 24 31.5 L 31.5 31.5 L 31.5 24 L 25.5 24 Z" fill="#1c9c9b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              width: 24,
              height: 24,
              isAsset: false,
            ):
            const SvgIcon(
              assetName:
              '<svg viewBox="193.0 863.0 27.0 27.0" ><path transform="translate(188.5, 858.5)" d="M 25.5 24 L 19.5 18 L 19.5 13.22999954223633 C 21.23999977111816 12.60000038146973 22.5 10.94999980926514 22.5 9 C 22.5 6.510000228881836 20.48999977111816 4.5 18 4.5 C 15.51000022888184 4.5 13.5 6.510000228881836 13.5 9 C 13.5 10.94999980926514 14.76000022888184 12.60000038146973 16.5 13.22999954223633 L 16.5 18 L 10.5 24 L 4.5 24 L 4.5 31.5 L 12 31.5 L 12 26.92499923706055 L 18 20.625 L 24 26.92499923706055 L 24 31.5 L 31.5 31.5 L 31.5 24 L 25.5 24 Z" fill="#7f858e" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              height: 24,
              width: 24,
              isAsset: false,
            ),
            label: 'Quantum device',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2?
                const SvgIcon(
                  assetName:
                  '<svg viewBox="333.0 859.0 15.7 31.5" ><path transform="translate(333.0, 859.0)" d="M 11.81250286102295 23.625 C 11.81250286102295 25.79960632324219 10.04961013793945 27.5625 7.875002384185791 27.5625 C 5.700395107269287 27.5625 3.93750262260437 25.79960632324219 3.93750262260437 23.625 C 3.93750262260437 21.45039176940918 5.700395107269287 19.6875 7.875002384185791 19.6875 C 10.04961013793945 19.6875 11.81250286102295 21.45039176940918 11.81250286102295 23.625 Z M 13.78125190734863 18.41685485839844 C 15.00630855560303 19.80500984191895 15.75000286102295 21.62801170349121 15.75000286102295 23.625 C 15.75000286102295 27.97445869445801 12.22452449798584 31.5 7.875002384185791 31.5 C 7.856606960296631 31.5 7.837535381317139 31.49993896484375 7.819077491760254 31.49981689453125 C 3.493857383728027 31.46979141235352 -0.02196108363568783 27.90924644470215 0.0001258295960724354 23.58396530151367 C 0.01021567266434431 21.6030330657959 0.7521268129348755 19.79547309875488 1.96875262260437 18.41685485839844 L 1.96875262260437 5.90625 C 1.96875262260437 2.644338846206665 4.613091468811035 0 7.875002384185791 0 C 11.13691329956055 0 13.78125190734863 2.644338846206665 13.78125190734863 5.90625 L 13.78125190734863 18.41685485839844 Z M 12.79687786102295 23.625 C 12.79687786102295 21.5123462677002 11.60516929626465 20.41409301757812 10.82812786102295 19.53356742858887 L 10.82812786102295 5.90625 C 10.82812786102295 4.277908802032471 9.50334358215332 2.953125 7.875002384185791 2.953125 C 6.24666166305542 2.953125 4.921877861022949 4.277908802032471 4.921877861022949 5.90625 L 4.921877861022949 19.53356742858887 C 4.138561248779297 20.42122840881348 2.963894605636597 21.50846862792969 2.953189134597778 23.59903526306152 C 2.93940806388855 26.29843902587891 5.141147136688232 28.52804946899414 7.839565277099609 28.54675102233887 L 7.875002384185791 28.546875 C 10.58892440795898 28.546875 12.79687786102295 26.33892059326172 12.79687786102295 23.625 Z" fill="#1c9c9b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',                  width: 24,
                  height: 24,
                  isAsset: false,
                  )
              : const SvgIcon(
              assetName:
              '<svg viewBox="316.0 859.0 15.7 31.5" ><path transform="translate(316.0, 859.0)" d="M 11.81250286102295 23.625 C 11.81250286102295 25.79960632324219 10.04961013793945 27.5625 7.875002384185791 27.5625 C 5.700395107269287 27.5625 3.93750262260437 25.79960632324219 3.93750262260437 23.625 C 3.93750262260437 21.45039176940918 5.700395107269287 19.6875 7.875002384185791 19.6875 C 10.04961013793945 19.6875 11.81250286102295 21.45039176940918 11.81250286102295 23.625 Z M 13.78125190734863 18.41685485839844 C 15.00630855560303 19.80500984191895 15.75000286102295 21.62801170349121 15.75000286102295 23.625 C 15.75000286102295 27.97445869445801 12.22452449798584 31.5 7.875002384185791 31.5 C 7.856606960296631 31.5 7.837535381317139 31.49993896484375 7.819077491760254 31.49981689453125 C 3.493857383728027 31.46979141235352 -0.02196108363568783 27.90924644470215 0.0001258295960724354 23.58396530151367 C 0.01021567266434431 21.6030330657959 0.7521268129348755 19.79547309875488 1.96875262260437 18.41685485839844 L 1.96875262260437 5.90625 C 1.96875262260437 2.644338846206665 4.613091468811035 0 7.875002384185791 0 C 11.13691329956055 0 13.78125190734863 2.644338846206665 13.78125190734863 5.90625 L 13.78125190734863 18.41685485839844 Z M 12.79687786102295 23.625 C 12.79687786102295 21.5123462677002 11.60516929626465 20.41409301757812 10.82812786102295 19.53356742858887 L 10.82812786102295 5.90625 C 10.82812786102295 4.277908802032471 9.50334358215332 2.953125 7.875002384185791 2.953125 C 6.24666166305542 2.953125 4.921877861022949 4.277908802032471 4.921877861022949 5.90625 L 4.921877861022949 19.53356742858887 C 4.138561248779297 20.42122840881348 2.963894605636597 21.50846862792969 2.953189134597778 23.59903526306152 C 2.93940806388855 26.29843902587891 5.141147136688232 28.52804946899414 7.839565277099609 28.54675102233887 L 7.875002384185791 28.546875 C 10.58892440795898 28.546875 12.79687786102295 26.33892059326172 12.79687786102295 23.625 Z" fill="#313b49" fill-opacity="0.6" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              width: 24,
              height: 24,
              isAsset: false,
            ),
            label: 'Result analysis',
          ),
        ],
        onTap: (value) => setState(() {
          _currentIndex = value;
        },
        ),
      ),
      body:MainScreens[_currentIndex],

      //   body: MainScreens.elementAt(_currentIndex),
    //   bottomNavigationBar: BottomNavigationBar(
    // currentIndex: _currentIndex,
    // // unselectedItemColor: const Color(0xff313B49),
    // // selectedIconTheme: const IconThemeData(color: Color(0xff27A1A0)),
    // // selectedLabelStyle: const TextStyle(
    // //   color: Color(0xff27A1A0),
    // //   fontSize: 12,
    // //   fontFamily: 'Segoe UI',
    // // ),
    // // unselectedLabelStyle: const TextStyle(
    // //   color: Color(0xff313B49),
    // //   fontSize: 12,
    // //   fontFamily: 'Segoe UI',
    // // ),
    // //
    // type: BottomNavigationBarType.fixed,
    // backgroundColor: const Color(0xffF7F6F8),
    // onTap: (index) {
    //   setState(() {
    //     _currentIndex = index;
    //   });
    // },
    // items: const <BottomNavigationBarItem>[
    //   BottomNavigationBarItem(
    //     icon: Icon(Icons.home),
    //     label: 'Home',
    //   ),
    //   BottomNavigationBarItem(
    //     icon: Icon(Icons.business),
    //     label: 'Business',
    //
    //   ),
    //   BottomNavigationBarItem(
    //     icon: Icon(Icons.school),
    //     label: 'School',
    //
    //   ),
    // ],
    // selectedItemColor: Colors.amber[800],
    //   )
    );
  }
}
