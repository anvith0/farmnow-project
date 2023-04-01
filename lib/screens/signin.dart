import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neww/screens/signup.dart';


import '../colors.dart';
import '../reusable_widgets/reusable.dart';
import 'home.dart';


bool visible = false;


class SignIn extends StatefulWidget {
  const SignIn({super.key, required String title});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            /*hexStringToColor("1CAC78"),
            hexStringToColor("018749"),
            hexStringToColor("006400"),*/

            hexStringToColor("#50C878"),
            hexStringToColor("#50C878"),
            hexStringToColor("#1CAC78"),


          ],begin: Alignment.topCenter, end: Alignment.bottomCenter)
        ),
        child: SingleChildScrollView(
          child: Padding (
            
            padding: EdgeInsets.fromLTRB(
              40, MediaQuery.of(context).size.height * 0.1, 50,0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/farmnow.png"),
                const SizedBox(
                  height: 20,
                ),
                
                reusableTextField("Enter e-mail", Icons.person_2_outlined, false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),

                const SizedBox(
                  height: 20,
                ),
                
                pageButton(context, true, (){
                  setState(() {
                    visible = true;
                  });
                signIn(_emailTextController.text, _passwordTextController.text);

                }),
                signUpOption()
              ],
            )  
          )
        )
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont have an account?",
        style: TextStyle(color: Colors.white70, fontSize: 18),
        ),
        GestureDetector(
          onTap:() {
            Navigator.push(context, 
              MaterialPageRoute(builder: (context) => const signUp()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
        )
      ],
    );
  }

  void signIn(String email, String password) async{
    
    try {
      final userCredential = await
        FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password
          );
        if(userCredential != null) {
          print("SUCCESS");
        }
        else {
          print("FAILUREEE");
        }
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
              ),
            );
            
    } on FirebaseAuthException catch (e) {
      if(e.code == "user-not-found") {
        print("No user found for the email");
      }
      else if(e.code == 'wrong-password') {
        print('Wrong password!');
      }
    }
    
  }
}

  

