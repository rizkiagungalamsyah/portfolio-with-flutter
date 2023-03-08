import 'package:flutter/material.dart';
import 'package:portfolio/widgets/HomePage.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Center(
            child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(labelText: "Email",
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.email)),
          ),
          SizedBox(height: 15,),
          TextFormField(
            controller: passController,
            obscureText: true,
            decoration: InputDecoration(labelText: "Password",
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.lock)),
          ),
          SizedBox(height: 45,
          ),
          OutlinedButton.icon(
              onPressed: () {
                login();
              },
              icon: Icon(
                Icons.login,
                size: 18,
              ),
              label: Text("login")),
        ],
            ),
          ),
        )
      )
    );
  }

  //Create Function to call login post api
  Future<void> login() async {
    if(passController.text.isNotEmpty && emailController.text.isNotEmpty){
      var response =
          await http.post(Uri.parse("https://reqres.in/api/login"), body: ({
            'email':emailController.text , 
            'password':passController.text
            }));
            if (response.statusCode==200){
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyDashboard()));
            } else {
              ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Credentials.")));
            }
    } else {
      ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Black Field not Allowed")));
    }
  }
}