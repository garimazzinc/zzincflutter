import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwipeUpAnimation extends StatefulWidget {
  @override
  _SwipeUpAnimationState createState() => _SwipeUpAnimationState();
}

class _SwipeUpAnimationState extends State<SwipeUpAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        for(int i=0; i <=2; i++)
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _controller.value * 20), // Adjust the offset for desired effect
              child: const Icon(
                Icons.keyboard_arrow_up,
                color: Color(0xFF1A8CD8),
                size: 20,
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
                offset: Offset(0, _controller.value * 10), // Adjust the offset for desired effect
                child:  Text('Swipe Up for Auditions!', style: GoogleFonts.oswald(color: Color(0xFF1A8CD8), fontSize: 25),)
            );
          },
        ),
      ],
    );
  }
}
