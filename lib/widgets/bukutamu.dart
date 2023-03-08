import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/widgets/bukutamu.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: bukutamu(),
    );
  }
}


class bukutamu extends StatefulWidget {
  const bukutamu({Key? key}) : super(key: key);

  @override
  _bukutamuState createState() => _bukutamuState();
}

class _bukutamuState extends State<bukutamu> {

  TextEditingController EmailC = TextEditingController();
  TextEditingController NamaC = TextEditingController();
  TextEditingController AlamatC = TextEditingController();

  String hasilResponse = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buku Tamu"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: EmailC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Email",
            ),
          ),
          SizedBox(height: 15),
          TextField(
            controller: NamaC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Nama",
            ),
          ),
          SizedBox(height: 15),
          TextField(
            controller: AlamatC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Alamat",
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () async {
              var myresponse = await http.post(
                Uri.parse("https://reqres.in/api/users"),
                body: {"Email": EmailC.text, "Nama": NamaC.text, "Alamat": AlamatC.text},
              );

              Map<String, dynamic> data = json.decode(myresponse.body) as Map<String, dynamic>;

              setState(() {
                hasilResponse = "${data['Email']} - ${data['Nama']} - ${data['Alamat']}";
              });
            },
            child: Text("SUBMIT"),
          ),
          SizedBox(height: 50),
          Divider(
            color: Colors.black,
          ),
          SizedBox(height: 10),
          Text(hasilResponse),
        ],
      ),
    );
  }
}