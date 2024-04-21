import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zinc/Login/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../home.dart';

class MobileNumber extends StatefulWidget {

  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  TextEditingController mobileNumberController = TextEditingController();
  bool isLoading = false;

  @override
  void initState(){
    super.initState();
    mobileNumberController.text = '+91';
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading:  IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back_sharp, color: Color(0xFF1A8CD8))),
        centerTitle: true,
        backgroundColor: Colors.black,

        title: Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(image: AssetImage('assets/images/zinclogo.png'), height:30),
              SizedBox(width: 10,),
              Text('Zinc', style: GoogleFonts.poppins(fontSize: 30, color: Color(0xFF1A8CD8)),),
            ],
          ),
        ),
        shadowColor: Color(0xFF1A8CD8),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                cursorColor: Color(0xFF1A8CD8),
                style: GoogleFonts.manrope(color: Color(0xFF1A8CD8), fontSize: 18),
                keyboardType: TextInputType.phone,
                controller: mobileNumberController,
                decoration: InputDecoration(
                  labelText: 'Enter Mobile Number',
                  labelStyle: GoogleFonts.manrope(color: Color(0xFF1A8CD8), fontSize: 18)
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async{
       await verifyPhoneNumber(mobileNumberController.text);
      },
        backgroundColor: const Color(0xFF1A8CD8),
        shape: CircleBorder(),
        child:  isLoading == true ? CircularProgressIndicator(color: Colors.black) :Icon(Icons.arrow_forward_sharp, color: Colors.black),

      ),
    );
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    setState(() {
      isLoading =true;
    });
    await Future.delayed(const Duration(seconds: 5));
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        // Auto-retrieve verification code if it's detected automatically
        FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failed
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(verficationId: verificationId,)));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle timeout
      },
    );
    setState(() {
      isLoading = false;
    });
    
  }
}