import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zinc/Login/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OtpScreen extends StatefulWidget {
  String verficationId;


  OtpScreen({required this.verficationId});
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // Controllers for each digit input field
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();
  final FocusNode _focusNode6 = FocusNode();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Set up focus listeners
    _controller1.addListener(() {
      if (_controller1.text.length == 1) {
        _focusNode2.requestFocus();
      }
    });
    _controller2.addListener(() {
      if (_controller2.text.length == 1) {
        _focusNode3.requestFocus();
      }
    });
    _controller3.addListener(() {
      if (_controller3.text.length == 1) {
        _focusNode4.requestFocus();
      }
    });
    _controller4.addListener(() {
      if (_controller4.text.length == 1) {
        _focusNode5.requestFocus();
      }
    });
    _controller5.addListener(() {
      if (_controller5.text.length == 1) {
        _focusNode6.requestFocus();
      }
    });
    _controller6.addListener(() {
      if (_controller6.text.length == 1) {
        login(widget.verficationId);
      }
    });
  }

  @override
  void dispose() {
    // Dispose controllers and focus nodes when not needed to prevent memory leaks
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _focusNode5.dispose();
    _focusNode6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text(
              'Enter OTP',
              style: GoogleFonts.orbitron(color :Color(0xFF1A8CD8), fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DigitInputBox(controller: _controller1, focusNode: _focusNode1),
                DigitInputBox(controller: _controller2, focusNode: _focusNode2),
                DigitInputBox(controller: _controller3, focusNode: _focusNode3),
                DigitInputBox(controller: _controller4, focusNode: _focusNode4),
                DigitInputBox(controller: _controller5, focusNode: _focusNode5),
                DigitInputBox(controller: _controller6, focusNode: _focusNode6),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await login(widget.verficationId);

        },
        backgroundColor: const Color(0xFF1A8CD8),
        shape: CircleBorder(),
        child: isLoading == false ?Icon(Icons.arrow_forward_sharp, color: Colors.black,) : CircularProgressIndicator(color: Colors.black),
      ),
    );
  }
  Future<void> login(String verificationId)async {
    isLoading = true;
    String otp = _controller1.text +
        _controller2.text +
        _controller3.text +
        _controller4.text +
        _controller5.text +
        _controller6.text
    ;
    // Add your logic to verify OTP here
    print('OTP entered: $otp');
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    await FirebaseAuth.instance.signInWithCredential(credential).then((value) =>  Navigator.push(context, MaterialPageRoute(builder: (context)=>Welcome())));

  }
}

class DigitInputBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const DigitInputBox({required this.controller, required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF1A8CD8)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        cursorColor: Color(0xFF1A8CD8),
        style: GoogleFonts.orbitron(color :Color(0xFF1A8CD8), fontSize: 30),
        controller: controller,
        focusNode: focusNode,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
          focusedBorder: InputBorder.none

        ),
      ),
    );
  }
}
