import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class CoverCube extends StatefulWidget {
  List<Map> cover;
  CoverCube({required this.cover});
  @override
  State<CoverCube> createState() => _CoverCubeState();
}

class _CoverCubeState extends State<CoverCube> {
  // GlobalKey<CarouselSliderState> _sliderKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
  return Container(
    width: 300,
    height: 500,
    child: CarouselSlider.builder(
      autoSliderTransitionTime: Duration(milliseconds: 3000),
      autoSliderDelay: Duration(milliseconds: 3000),
      autoSliderTransitionCurve: Curves.linear,
      enableAutoSlider: true,
        unlimitedMode: true,
        slideBuilder: (index) {
          return Stack(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    widget.cover[index]['image'],
                    fit: BoxFit.cover,
                    width: 295,
                    height: 295,
                  ),
                ),
              ),
            ],
          );
        },
        slideTransform: const CubeTransform(
          rotationAngle: 90,
        ),
        itemCount: widget.cover.length),
  );
  }
}