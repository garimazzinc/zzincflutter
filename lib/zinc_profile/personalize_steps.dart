import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zinc/common/constants/constants_basic_info.dart';
import 'package:zinc/zinc_profile/profile_complete.dart';

import '../login/model/user.dart';
import '../login/service/signup.dart';

class PersonalizeSteps extends StatefulWidget {
  User user;

  PersonalizeSteps({required this.user});
  @override
  State<PersonalizeSteps> createState() => _PersonalizeSteps();
}

class _PersonalizeSteps extends State<PersonalizeSteps> {
  TextEditingController experienceController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  List<String> experienceList = [];
  List<String> linkList = [];
  List<String> skill = [];



  void addExperienceToList() {
    setState(() {
      String newText = experienceController.text.trim();
      if (newText.isNotEmpty) {
        experienceList.add(newText);
        experienceController.clear();
      }
    });
  }

  void removeExperience(int item){
    experienceList.removeAt(item);
    setState(() {});
  }

  void addLinkToList() {
    setState(() {
      String newText = linkController.text.trim();
      if (newText.isNotEmpty) {
        linkList.add(newText);
        linkController.clear();
      }
    });
  }

  void removeLink(int item){
    linkList.removeAt(item);
    setState(() {});
  }

  @override
  Widget build(BuildContext context){
    dynamic user = widget.user;
    return Scaffold(
      appBar:  AppBar(
        leading:  IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back_sharp, color: Color(0xFF1A8CD8))),
        centerTitle: true,
        backgroundColor: Colors.white,

        title: Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(image: AssetImage('assets/images/zinclogo.png'), height:30),
              SizedBox(width: 10,),
              Text('Zinc', style: GoogleFonts.poppins(fontSize: 30, color:Color(0xFF1A8CD8)),),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                color:Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText('Experience', style: GoogleFonts.abel(color: Color(0xFF1A8CD8)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        maxLines: 3,
                        maxLength: 250,
                        style: GoogleFonts.manrope(color: Colors.black, fontSize: 18),
                        keyboardType: TextInputType.text,
                        controller:experienceController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: addExperienceToList,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white)
                            ),
                            hintText: 'Last project, Career highlights, Best performance and more',
                            hintStyle: GoogleFonts.manrope()
                        ),
                        onSubmitted: (_) => addExperienceToList(),
                      ),
                    ),
                    if(experienceList.isNotEmpty)
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: experienceList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                               Padding(
                                 padding: const EdgeInsets.symmetric(vertical: 8.0),
                                 child: CircleAvatar(backgroundColor: Colors.greenAccent,radius: 5),
                               ),
                              SizedBox(width: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.72,
                                child: Text(experienceList[index], style: GoogleFonts.abel(fontSize: 18, fontWeight: FontWeight.w600),
                                maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  removeExperience(index);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(Icons.cancel, size: 15, color: Colors.red),
                                  ),
                              ),

                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText('Work Links', style: GoogleFonts.abel(color: Color(0xFF1A8CD8)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        maxLines: 3,
                        maxLength: 100,
                        style: GoogleFonts.manrope(color: Colors.black, fontSize: 18),
                        keyboardType: TextInputType.text,
                        controller: linkController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: addLinkToList,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFF1A8CD8))
                            ),
                            hintText: 'Youtube Links and more',
                            hintStyle: GoogleFonts.manrope()
                        ),
                      ),
                    ),
                    if(linkList.isNotEmpty)
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: linkList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  child: Icon(Icons.link),
                                ),
                                const SizedBox(width: 5,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.72,
                                  child: Text(linkList[index], style: GoogleFonts.abel(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.blue),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    removeLink(index);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(Icons.cancel, size: 15, color: Colors.red),
                                  ),
                                ),

                              ],
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
                padding: const EdgeInsets.all(2.0),
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText('Skilled Activity', style: GoogleFonts.abel(color: Color(0xFF1A8CD8)),
                      ),
                    ),
                  Wrap(
                  spacing: 3.0, // Spacing between items
                  runSpacing: 3.0, // Spacing between lines
                  children: Constants.sports.map((item) {
                    return InkWell(
                    onTap: (){
                      if(skill.contains(item['title'])){
                        skill.remove(item['title']);
                      }else{
                        skill.add(item['title']);
                      }
                      setState(() {

                      });
                      print(skill);
                    },
                      child: Chip(
                        backgroundColor:  skill.contains(item['title']) ? Colors.blue.withOpacity(0.5) : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        avatar: Image(image: AssetImage(item['icon']),),
                        label: Text(
                          item['title'],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  }).toList(),
                  )
                  ],
                ),
              ),

            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(2.0),
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText('Skilled Interests', style: GoogleFonts.abel(color: Color(0xFF1A8CD8)),
                      ),
                    ),
                    Wrap(
                      spacing: 3.0, // Spacing between items
                      runSpacing: 3.0, // Spacing between lines
                      children: Constants.hobbies.map((item) {
                        return InkWell(
                          onTap: (){
                            if(skill.contains(item['title'])){
                              skill.remove(item['title']);
                            }else{
                              skill.add(item['title']);
                            }
                            setState(() {

                            });
                            print(skill);
                          },
                          child: Chip(
                            backgroundColor: skill.contains(item['title']) ? Colors.blue.withOpacity(0.5) : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            avatar: Image(image: AssetImage(item['icon']),),
                            label: Text(
                              item['title'],
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),

            ),

            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                color: Color(0xFF1A8CD8),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText('The Introduction Video', style: GoogleFonts.abel(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: DottedBorder(
                          color: Colors.white,
                          strokeWidth: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.play_circle, color: Colors.white, size: 50,),
                          )
                        ),
                      ),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(2.0),
              child: Card(
                color: Color(0xFF1A8CD8),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText('Add More Videos', style: GoogleFonts.abel(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DottedBorder(
                          color: Colors.white,
                          strokeWidth: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.add, color: Colors.white, size: 50,),
                          )
                      ),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                child: OutlinedButton(onPressed: ()async{
                 user.skills = skill;
                  user.experience = experienceList;
                  user.links = linkList;
                  user.email = "akshayvachhani.zzinc.com";
                  // debugPrint(widget.user.toJson());
                  String jsonString = jsonEncode(user.toJson());

                  // Print the formatted JSON string
                  printFormattedJson(jsonString);

                  await SignUpService().signUpUser(widget.user).then((value) =>
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ProfileComplete()))
                  );
                }, child: Text('Save', style: GoogleFonts.poppins(color:Color(0xFF1A8CD8) ),)),),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
  void printFormattedJson(String jsonString) {
    // Convert the JSON string to a dynamic map
    dynamic jsonMap = jsonDecode(jsonString);

    // Convert the dynamic map to a formatted string
    String formattedJson = JsonEncoder.withIndent('  ').convert(jsonMap);

    // Split the formatted JSON string into multiple lines
    List<String> lines = formattedJson.split('\n');

    // Print each line of the JSON string
    for (String line in lines) {
      print(line);
    }
  }
}