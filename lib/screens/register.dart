import 'package:flutter/material.dart';
import 'package:todo_app/model/my_button.dart';
import 'package:todo_app/screens/login.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController registernameController = TextEditingController();
    TextEditingController registerpasswordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Hey Welcome",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Padding(
                  
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: TextField(
                    
                    controller: registernameController ,
                     
                    decoration: const InputDecoration(
                      hintText: "Username",
                      filled: true,
                      fillColor: Colors.white,
                    ),

                    
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: registerpasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const MyButton(),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 130, vertical: 15),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Login()));
                    },
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
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
