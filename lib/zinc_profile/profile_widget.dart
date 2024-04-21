import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: Colors.blue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(
                builder: (context) {
                  return  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: const Image(image: AssetImage('assets/icons/closeUp.png'), height: 180,fit: BoxFit.fitWidth, width: double.infinity,));
                }
              ),
              Padding(
                padding:  const EdgeInsets.only(top:5.0),
                child: Text('Jasmine Malik(She/Her)',style: GoogleFonts.abel(),),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const  Icon(Icons.location_pin, color: Colors.black54),
                    Text('Bengaluru, India', style: GoogleFonts.abel(fontSize: 15, color: Colors.black54),),
                  ],),
              ),
              Padding(
                padding:  const EdgeInsets.only(top:5.0),
                child: Text('Fluent in Urdu, Hindi, English, Malayalam',style: GoogleFonts.abel(fontSize: 15, color: Colors.black54),),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){}, child: Text('See Profile')),
                    ElevatedButton(onPressed: (){}, child: Text('Edit Profile')),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}