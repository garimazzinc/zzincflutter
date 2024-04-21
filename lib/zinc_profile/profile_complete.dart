import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home.dart';

class ProfileComplete extends StatefulWidget {
  @override
  _ProfileCompleteState createState() => _ProfileCompleteState();
}

class _ProfileCompleteState extends State<ProfileComplete> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotateAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _blinkAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _fadeInAnimation;
  late Animation<Alignment> _startAnimationRight;
  late Animation<Alignment> _startAnimationLeft;
  late Animation<Alignment> _stopAnimationRight;
  late Animation<Alignment> _stopAnimationLeft;
  late Timer _timer;
  bool _isVisible = false;
  bool _isVisible2 = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 7),
    );

    _startAnimationRight = Tween<Alignment>(
      begin: Alignment.center + Alignment(0, -0.02),
      end: Alignment.center + Alignment(-0.8, 0.00),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.2, 0.4, curve: Curves.easeInOut),
    ));

    _stopAnimationRight = Tween<Alignment>(
      begin: Alignment.center + Alignment(0.8, 0.00),
      end: Alignment.center + Alignment(0, -0.02),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.4, 0.6, curve: Curves.easeInOut),
    ));

    _startAnimationLeft = Tween<Alignment>(
      begin: Alignment.center + Alignment(0, 0.02),
      end: Alignment.center + Alignment(0.8, 0.00),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.2, 0.4, curve: Curves.easeInOut),
    ));

    _stopAnimationLeft = Tween<Alignment>(
      begin: Alignment.center + Alignment(-0.8, 0.00),
      end: Alignment.center + Alignment(0, 0.02),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.4, 0.6, curve: Curves.easeInOut),
    ));

    _rotateAnimation = Tween<double>(
      begin: 0.0,
      end: 3.14,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.2, curve: Curves.easeInCubic),
    ));


    _blinkAnimation = Tween<double>(
      begin: 1.0,
      end: 1.0,
    ).animate(_controller);

    _fadeAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.4, 0.4, curve: Curves.easeInOut),
    ));

    _fadeInAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.4, 0.4, curve: Curves.easeInOut),
    ));

    _controller.forward();

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isVisible = true;
      });
    });
    // Hide blinking text after 5 seconds
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isVisible = false;
      });
    });

    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        _isVisible2 = true;
      });
    });
    // Hide blinking text after 5 seconds


    _timer = Timer(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // Logo images
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Align(
                      alignment: _startAnimationRight.value,
                    child: Transform.rotate(
                      angle: _rotateAnimation.value,
                        child: Image.asset(
                          'assets/icons/profile_complete/logo_1.png',
                          height: 100,
                          width: 100,
                        ),

                    ),
                ),
                  );
              },
            ),
            FadeTransition(
              opacity: _fadeAnimation,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) {
                  return Align(
                    alignment: _startAnimationLeft.value,
                    // Reverse rotation for mirror image effect
                    child: Transform.rotate(
                      angle: _rotateAnimation.value,

                        child: Image.asset(
                          'assets/icons/profile_complete/logo_2.png',
                          height: 100,
                          width: 100,
                        ),

                    ),
                  );
                },
              ),
            ),
            // Blinking text
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 250),
                  child: Center(
                    child: Text(
                      'Zzinc',
                      style: GoogleFonts.poppins(color: Color(0xFF1A8CD8), fontSize: 40),
                    ),
                  ),
                );
              },
            ),
            FadeTransition(
              opacity: _fadeInAnimation,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) {
                  return Align(
                    alignment: _stopAnimationLeft.value,
                    // Reverse rotation for mirror image effect
                    child: Transform.rotate(
                      angle: _rotateAnimation.value,

                      child: Image.asset(
                        'assets/icons/profile_complete/logo_1.png',
                        height: 100,
                        width: 100,
                      ),

                    ),
                  );
                },
              ),
            ),
            FadeTransition(
              opacity: _fadeInAnimation,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) {
                  return Align(
                    alignment: _stopAnimationRight.value,
                    // Reverse rotation for mirror image effect
                    child: Transform.rotate(
                      angle: _rotateAnimation.value,

                      child: Image.asset(
                        'assets/icons/profile_complete/logo_2.png',
                        height: 100,
                        width: 100,
                      ),

                    ),
                  );
                },
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return AnimatedOpacity(
                  opacity: _isVisible2 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 250),
                  child: Align(
                    alignment: Alignment(0.0,0.23),
                    child: Text(
                      'Zzinc',
                      style: GoogleFonts.poppins(color: Color(0xFF1A8CD8), fontSize: 35),
                    ),
                  ),
                );
              },
            ),
            // AnimatedBuilder(
            //   animation: _controller,
            //   builder: (BuildContext context, Widget? child) {
            //     return AnimatedOpacity(
            //       opacity: _isVisible2 ? 1.0 : 0.0,
            //       duration: Duration(milliseconds: 250),
            //       child: const Align(
            //         alignment: Alignment(0.0,0.5),
            //         child: CupertinoActivityIndicator(
            //           color: Color(0xFF1A8CD8),
            //           radius: 20,
            //         )
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
