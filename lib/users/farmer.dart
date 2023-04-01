import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neww/roles.dart';
import 'package:neww/screens/signin.dart';

//import '../navbar.dart';

// ignore: must_be_immutable
class Farmer extends StatefulWidget {
  String id;
  Farmer({super.key, required this.id});
  //const Farmer({super.key, required String id});

  @override
  // ignore: no_logic_in_create_state
  State<Farmer> createState() => _FarmerState(id: id);
}

class _FarmerState extends State<Farmer> {
  String id;
  var role;
  var email;
  var name;
  var phNo;
  UserRole loggedInUser = UserRole();

  _FarmerState({required this.id});
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users") //.where('uid', isEqualTo: user!.uid)
        .doc(id)
        .get()
        .then((value) {
      this.loggedInUser = UserRole.fromMap(value.data());
    }).whenComplete(() {
      CircularProgressIndicator();
      setState(() {
        email = loggedInUser.email.toString();
        role = loggedInUser.role.toString();
        id = loggedInUser.uid.toString();
        name = loggedInUser.name.toString();
        phNo = loggedInUser.phNo.toString();
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Farmer'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: () {
            logout(context);
          },
          icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),

    drawer: Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Welcome $name!",style: TextStyle(fontSize: 25)),
            accountEmail: Text(loggedInUser.email.toString(),style: TextStyle(fontSize: 17)),
            // currentAccountPicture: CircleAvatar(
            //   child: ClipOval(
            //     child: Image.network(
            //       'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
            //       fit: BoxFit.cover,
            //       width: 90,
            //       height: 90,
            //     ),
            //   ),
            // ),
            decoration: BoxDecoration(
              color: Colors.green,
               image: DecorationImage(
                   fit: BoxFit.fill,
                   image: NetworkImage(
                       'https://oflutter.com/wp-content/uploads/2021/02/profile-bg-2.jpg')),
            ),
          ),
         
          
          // ListTile(
          //   leading: Icon(Icons.share),
          //   title: Text('Share'),
          //   onTap: () => null,
          // ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Slot Requests",style: TextStyle(fontSize: 17),),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Farm Details',style: TextStyle(fontSize: 17),),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings',style: TextStyle(fontSize: 17),),
            onTap: () => null,
          ),
          
          Divider(),
          ListTile(
            title: Text('Logout',style: TextStyle(fontSize: 17),),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
        ],
      ),
    ),

    bottomNavigationBar: BottomNavigationBar(
    backgroundColor: Colors.green,
    selectedItemColor: Colors.white,

    selectedFontSize: 15,
    unselectedFontSize: 15,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),

    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        
        icon: Icon(Icons.home),
        label: ('Home'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.store_mall_directory_sharp),
        label: 'Store',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ],
  ),      
    );
  }


  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SignIn(title: "Logout"),
      ),
    );
  }
}