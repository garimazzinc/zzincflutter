import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zinc/theme.dart';
import 'package:zinc/zinc_profile/basic_info.dart';

class Welcome extends StatefulWidget{

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  int _currentIndex = 0;
  List<Map> promotion = [
    {'image' : 'assets/icons/action.png',
      'title' : 'Discover your next starring role with Zinc'
    },
    {
      'image' : 'assets/icons/bollywood.png',
      'title' : 'Audition for 1000+ Big Screen Projects'
    },
    {
      'image' : 'assets/icons/ott.png',
      'title' : 'Audition for 5000+ OTT Projects'
    }
  ];

  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Welcome to \nZinc!', style: GoogleFonts.poppins(fontSize: 45, color: Color(0xFF1A8CD8), fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 50),
              CarouselSlider(
                items: promotion.map((promotion) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Image(
                              height: 100,
                              width: 100,
                              image: AssetImage(promotion['image']),
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AutoSizeText(promotion['title'], style: GoogleFonts.abel(color: Color(0xFF1A8CD8), fontSize: 20), maxLines: 1,),
                          )
                        ],
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 0.9,
                  autoPlay: true,
                  aspectRatio: 1,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: promotion.map((image) {
                  int index = promotion.indexOf(image);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(10),
          width: 300,
          child: ElevatedButton(
            child: Text('Create your Zinc profile'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BasicInfo()));
            },
          ),
        ),
      ),
    );
  }
}