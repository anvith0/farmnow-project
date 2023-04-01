import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../roles.dart';
import '../users/farmer.dart';
import '../users/individual.dart';
import '../users/organization.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return contro();
  }
}


class contro extends StatefulWidget {
  contro();

  @override
  _controState createState() => _controState();
}

class _controState extends State<contro> {
  _controState();
  User? user = FirebaseAuth.instance.currentUser;
  UserRole loggedInUser = UserRole();
  var rooll;
  var emaill;
  // ignore: prefer_typing_uninitialized_variables
  var id = "";
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users") //.where('uid', isEqualTo: user!.uid)
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserRole.fromMap(value.data());
    }).whenComplete(() {
      const CircularProgressIndicator();
      setState(() {
        emaill = loggedInUser.email.toString();
        rooll = loggedInUser.role.toString();
        id = loggedInUser.uid.toString();
      });
    });
  }

  Farmer routing() {
    if (rooll == 'Farmer') {
      return Farmer(
        id: id,
      );
    }/* else if (rooll == 'Individual'){
      return Individual(
        id: id,
      );
    }*/
    /*(else if (rooll == 'Organization') {
      return Organization(
        id: id,
      );
    }*/
    return Farmer(id: id);
  }

  @override
  Widget build(BuildContext context) {
    const CircularProgressIndicator();
    return routing();
  }
}