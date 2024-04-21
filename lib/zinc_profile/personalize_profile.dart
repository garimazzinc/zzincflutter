import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zinc/zinc_profile/personalize_steps.dart';
import 'package:zinc/zinc_profile/profile_complete.dart';

import '../login/model/user.dart';
import 'basic_info.dart';

class PersonalizeProfile extends StatefulWidget{
  User user;

  PersonalizeProfile({required this.user});

  @override
  State<PersonalizeProfile> createState() => _PersonalizeProfileState();
}

class _PersonalizeProfileState extends State<PersonalizeProfile> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF1A8CD8),
      appBar:  AppBar(
        leading:  IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back_sharp, color: Colors.white)),
        centerTitle: true,
        title: Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(image: AssetImage('assets/images/zinc_white.png'), height:30),
              Text('Zinc', style: GoogleFonts.poppins(fontSize: 30, color: Colors.white),),
            ],
          ),
        ),
        backgroundColor: Color(0xFF1A8CD8),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileComplete()));
          }, child: Text('SKIP', style: GoogleFonts.poppins(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('You are almost there!',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 20)),
            ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Personalize your zinc profile, make yourself standout in auditions and increase your chances of getting casted.',
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 20)),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalizeSteps(user: widget.user,)));
      },
        backgroundColor: Colors.white,
        shape: CircleBorder(),
        child: const Icon(Icons.arrow_forward_sharp, color:  Color(0xFF1A8CD8),),

      ),
    );
  }
}