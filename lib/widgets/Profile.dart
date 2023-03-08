// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      appBar: AppBar(

        title: Text(
          
          'Profile',
        ),

      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 35, 20, 0),
            child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Halo,',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
              ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 15),
            child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Saya Rizki Agung Alamsyah, Mahasiswa Semester 5 Teknik Informatika Politeknik Harapan Bersama Tegal.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
              ),
          ),
        ],
      ),

    );
    
  }
}