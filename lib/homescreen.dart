import 'package:flutter/material.dart';
import 'package:userath_appwrite/appwriteservice.dart';
import 'package:userath_appwrite/login.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AppwriteServices _appwriteService;

  void initState() {
    super.initState();
    _appwriteService = AppwriteServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          GestureDetector(
            onTap: () async {
              try {
                await _appwriteService.logoutUser();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              } catch (e) {
                print(e);
              }
            },

            child: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(child: Text("Home Screen")),
    );
  }
}