import 'package:flutter/material.dart';
import 'package:userath_appwrite/appwriteservice.dart';
import 'package:userath_appwrite/homescreen.dart';
import 'package:userath_appwrite/siginup.dart';

class LoginScreen extends StatefulWidget {
const LoginScreen({super.key});

@override
State<LoginScreen>createState() =>_loginScreenState();

}
class _loginScreenState extends State<LoginScreen> {
  late AppwriteServices _appwriteservice;

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _appwriteservice = AppwriteServices();
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.pink[400]),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              SizedBox(height: 100),
              Text(
                "login",
                style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    hintText: "email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),

                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 300,
                 child: TextField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
              ),
                  ),
                 ),
              ),
              SizedBox(height: 20),
              SizedBox(height:35),
              SizedBox(
                height: 50,
                width: 300,
                 child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[400],
                  ),
                  onPressed: () async {
                    if (emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty) {
                      try {
                        await _appwriteservice.loginUser(
                          emailcontroller.text,
                          passwordcontroller.text,
          
                        );
                        Navigator.pushReplacement(
                          context, 
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                        emailcontroller.clear();
                        passwordcontroller.clear();
                      } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text(e.toString())),
                          ); 
                      }

                      } else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("please fill all fiels")),
                        );


                      }
                    },

                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont have an account?",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                         ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
                    
                  
  