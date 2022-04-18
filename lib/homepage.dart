import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  final String username;
  final bool isLogin;

  const HomePage({Key? key, required this.username, required this.isLogin}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Future<SharedPreferences> _myPref = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        actions: [
          IconButton(
            onPressed: () {
              bool status = false;
              _prosesLogout(status, widget.username);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return LoginPage(status: status);
              }));

            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Text("Hii ${widget.username} Welcome "),

            )
          ],
        ),
      ),
    );
  }

  void _prosesLogout(bool status, String username) async {
    SharedPreferences getPref = await _myPref;
    await getPref.setBool("LoginStatus", status);
    await getPref.setString("Username", username);
  }

}
