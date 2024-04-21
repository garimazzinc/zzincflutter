import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zinc/Login/mobileNumber.dart';
import 'package:zinc/common/ui_elements/cover_cube.dart';
import 'package:zinc/theme.dart';

class LoginScreen extends StatelessWidget {
  final List<Map> cover = [
    {'image':'assets/images/login_cover_1.JPG',
      'title': 'Symphony of action and reaction'
    },
    {
      'image':'assets/images/login_cover_2.JPG',
      'title':'For the joy of entertaining'
    },
    {
      'image':'assets/images/login_cover_3.JPG',
      'title':'For the art of story telling'
    },
    {
      'image': 'assets/images/login_cover_4.JPG',
      'title': 'The glam, glitter and Zzinc'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 20,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/zinclogo.png'), height:30),
              SizedBox(width: 10,),
              Text('Zinc', style: GoogleFonts.poppins(fontSize: 30, color: Color(0xFF1A8CD8)),),
            ],
          ),
          shadowColor: Color(0xFF1A8CD8),
        ),
        backgroundColor: Colors.black,
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MobileNumber()));
                  },
                  child: Text('login'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MobileNumber()));
                },
                child: Text('Create Acount', style: TextStyle(
                  color: Color(0xFF1A8CD8),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ],
          ),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(8.0),
            child: CoverCube(cover: cover)
          ),
        ),
      ),
    );
  }
}
