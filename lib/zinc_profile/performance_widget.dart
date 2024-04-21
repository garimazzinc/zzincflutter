import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PerformanceWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
          ),
          child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Image(image: AssetImage(
                        'assets/icons/auditioned.png',
                      ),
                      height: 40,
                        width: 40,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Center(child: Text('15', style: GoogleFonts.orbitron(color: Color(0xFF1A8CD8), fontSize: 25),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Auditions', style: GoogleFonts.abel(color: Color(0xFF1A8CD8)),),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Image(image: AssetImage(
                        'assets/icons/shortlist.png',
                      ),
                        height: 40,
                        width: 40,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Center(child: Text('11', style: GoogleFonts.orbitron(color: Color(0xFF1A8CD8), fontSize: 25),)),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Shortlisted', style: GoogleFonts.abel(color: Color(0xFF1A8CD8)),),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Image(image: AssetImage(
                        'assets/icons/casted.png',
                      ),
                        height: 40,
                        width: 40,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Center(child: Text('3', style: GoogleFonts.orbitron(color: Color(0xFF1A8CD8), fontSize: 25),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Casted', style: GoogleFonts.abel(color: Color(0xFF1A8CD8)),),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}