import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuditionWidget extends StatefulWidget{
  dynamic item;
  AuditionWidget({required this.item});

  @override
  State<AuditionWidget> createState() => _AuditionWidgetState();
}

class _AuditionWidgetState extends State<AuditionWidget> {
  int _currentIndex =0;
  @override
  Widget build(BuildContext){
    dynamic size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.43,
      padding: EdgeInsets.all(8),
    child: Stack(
      children: [
        Card(
          elevation: 1,
            child: Column(
              children: [
                CarouselSlider(
                  items: [
                    Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF1A8CD8),
                      ),
                      height: size.height * 0.31,
                      width: double.infinity,
                      child: Center(child: Text(widget.item, style: GoogleFonts.poppins(color: Colors.white),)),
                    ),
                    Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: size.height * 0.31,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment : MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image(image: AssetImage('assets/icons/dates.png'), height: 30, width: 30,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('5/6/24 - 31/12/24', style: GoogleFonts.abel(fontWeight: FontWeight.w600, fontSize: 15),),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image(image: AssetImage('assets/icons/location.png'), height: 30, width: 30,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Panjim, Goa', style: GoogleFonts.abel(fontWeight: FontWeight.w600, fontSize: 15)),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image(image: AssetImage('assets/icons/budget.png'), height: 30, width: 30,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('\u{20B9}30,000+', style: GoogleFonts.abel(fontWeight: FontWeight.w600, fontSize: 15)),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image(image: AssetImage('assets/icons/age.png'), height: 30, width: 30,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('25 - 30', style: GoogleFonts.abel(fontWeight: FontWeight.w600, fontSize: 15),),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image(image: AssetImage('assets/icons/height.png'), height: 30, width: 30,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('175cm to 180cm', style: GoogleFonts.abel(fontWeight: FontWeight.w600, fontSize: 15)),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image(image: AssetImage('assets/icons/weight.png'), height: 30, width: 30,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('75kg to 80kg', style: GoogleFonts.abel(fontWeight: FontWeight.w600, fontSize: 15)),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment : MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image(image: AssetImage('assets/icons/body.png'), height: 30, width: 30,),
                              ),
                              Container(
                                width: size.width * 0.8,
                                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                                child: Text('Curly hairs, Tattoos, Funky looks, Multiple piercings', style: GoogleFonts.abel(fontWeight: FontWeight.w600, fontSize: 15), maxLines: 2,),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ], options: CarouselOptions(
                  height: size.height * 0.31,
                  viewportFraction: 1,
                  autoPlay: false,
                  // aspectRatio: 1,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),

                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: size.height * 0.08,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage('assets/icons/director.png'), height: 30, width: 30,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Anurag Kashyap', style: GoogleFonts.abel(fontWeight: FontWeight.w600, fontSize: 20),),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image(image: AssetImage('assets/icons/synergy.png'), height: 30, width: 30, ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('High', style: GoogleFonts.abel(fontWeight: FontWeight.w600, fontSize: 20 ),),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
        ),
        Positioned(
            left: size.width * 0.45,
            bottom: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == 0 ? Colors.white : Colors.black,
              ),
            ),
            Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == 1 ? Colors.blue : Colors.black,
              ),
            )
          ],
        )),
        Positioned(
            top: 5,
            right: 5,
            child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border, color: Colors.black, size: 30,),)),
      ],
    ),
    );
  }
}