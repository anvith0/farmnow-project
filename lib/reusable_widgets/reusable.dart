import 'package:flutter/material.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 300,
    height: 300,
    color: Colors.white,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
      return TextField(
        
        controller: controller,
        obscureText: isPasswordType,
        enableSuggestions: !isPasswordType,
        autocorrect: !isPasswordType,
        cursorColor: Colors.white,
        style: TextStyle( color: Colors.white.withOpacity(0.9), fontSize: 18),
        decoration: InputDecoration(

          prefixIcon:  Icon(icon, color: Colors.white70,
          ),
          labelText: text,
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)
          )
        ),
        keyboardType: isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      );
      
    }

Container pageButton(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: (MediaQuery.of(context).size.width)/3
    ,
    height: 40,
    margin: const EdgeInsets.fromLTRB(0,10,0,20),
    child: ElevatedButton(
      onPressed: () {
        onTap();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if(states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
          )
        ),
        child: Text(
          isLogin ? "Log In" : "Sign Up",
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
    ),
  );
}