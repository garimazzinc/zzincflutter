import 'dart:convert';

import 'package:animated_weight_picker/animated_weight_picker.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zinc/common/ui_elements/dropdown_with_search.dart';
import 'package:zinc/login/service/signup.dart';
import 'package:zinc/zinc_profile/personalize_profile.dart';
import 'dart:io';
import '../common/ui_elements/height_picker.dart';
import '../login/model/user.dart';

class BasicInfo extends StatefulWidget {
  @override
  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  int index = 0;
  List<String?> title = [
    'Name?',
    'Email Id?',
    'Age?',
    'Height?',
    'Weight?',
    'Language',
    'Gender?',
    'Skin Type?',
    'Hair Type?',
    'Close Up Shot',
    'Mid Shot',
    'Full Shot'
  ];
  List<String?> hintText = [
    'Enter Full Name',
    'Enter Email Id',
    'Enter Age',
    'Enter Height',
    'Enter Weight',
    'Select Languages',
    'Gender',
    'Enter Skin Type',
    'Enter Hair Type'
  ];
  List<TextEditingController> controller = [];
  List<String> languages = [
    'English',
    'Hindi',
    'Bengali',
    'Telugu',
    'Marathi',
    'Tamil',
    'Urdu',
    'Gujarati',
    'Kannada',
    'Odia (Oriya)',
    'Malayalam',
    'Punjabi',
    'Assamese',
    'Maithili',
    'Bhili/Bhilodi',
    'Santali',
    'Kashmiri',
    'Nepali',
    'Gondi',
    'Sindhi',
    'Konkani',
    'Haryanvi',
    'French',
    'Italian',
    'German',
  ];
  List<String> gender = ['Male', 'Female', 'Other'];
  int selectedGender = -1;
  int selectedHair = -1;
  int selectedSkin = -1;
  List<String> filteredLanguages = [];
  List<String> selectedLanguages = [];
  int selectedLanguageIndex = -1;
  TextEditingController searchController = TextEditingController();
  dynamic closeUp;
  dynamic midShot;
  dynamic fullShot;
  dynamic closeUpBase;
  dynamic midShotBase;
  dynamic fullShotBase;
  List<Map<String,dynamic>> hair = [
    {'title' : 'Straight Hair',
      'image' : 'assets/icons/straight-hair.png'
    },
    {'title' : 'Wavy Hair',
      'image' : 'assets/icons/wavy-hair.png'
    },
    {'title' : 'Curly Hair',
      'image' : 'assets/icons/curly-hair.png'
    }
  ];
  List<Map<String,dynamic>> skin = [
    {'title' : 'Light',
      'color' : const Color(0xFFfdf5e2)
    },
    {'title' : 'Fair',
      'color' : const Color(0xFFfddcb4)
    },
    {'title' : 'Medium',
      'color' : const Color(0xFFedac69)
    },
    {'title' : 'Dark',
      'color' : const Color(0xFF8D5524)
    }
  ];

  bool isUpload = false;
  User user = User();

  @override
  void initState() {
    super.initState();
    for (int i = 1; i < title.length; i++) {
      controller.add(TextEditingController());
    }
    filteredLanguages.addAll(languages);
  }

  void filterLanguages(String query) {
    filteredLanguages.clear();
    if (query.isEmpty) {
      filteredLanguages.addAll(languages);
    } else {
      filteredLanguages.addAll(languages
          .where((lang) => lang.toLowerCase().contains(query.toLowerCase())));
    }
    setState(() {});
  }

  void onGenderSelected(int gender) {
    setState(() {
      selectedGender = gender;
    });
  }
  void onSelectedHair(int hair) {
    setState(() {
      selectedHair = hair;
    });
  }

  void onSelectedSkin(int skin) {
    setState(() {
      selectedSkin = skin;
    });
  }


  Future<void> _checkPermissionAndPickImage(int index) async {
    final PermissionStatus status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    if (status.isGranted) {
      _pickImage(index);
    } else {
      // Handle denied or restricted permission
    }
  }

  Future<void> _pickImage(int index) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    index == 0
    ?closeUp = pickedImage
    : index ==1
    ?midShot = pickedImage
    :index ==2
    ?fullShot = pickedImage
    :null;
    index ==0
    ?closeUpBase =  await fileToBase64(pickedImage!)
        : index ==1
    ?midShotBase =  await fileToBase64(pickedImage!)
        :index ==2
    ?fullShotBase = await fileToBase64(pickedImage!)
        :null;
    setState(() {});
    // Do something with the picked image, like uploading it
  }

  Future<String> fileToBase64(XFile file) async {
    List<int> imageBytes = await file.readAsBytes();
    return base64Encode(imageBytes);
  }

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double maxWidth = size.width;
    double totalArea = 0;
    for (String language in filteredLanguages) {
      TextSpan span = TextSpan(style: TextStyle(fontSize: 20), text: language);
      TextPainter tp =
          TextPainter(text: span, textDirection: TextDirection.ltr);
      tp.layout();
      totalArea += tp.width * tp.height;
    }
    int crossAxisCount = (maxWidth / totalArea).ceil();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_sharp, color: Color(0xFF1A8CD8))),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                  image: AssetImage('assets/images/zinclogo.png'), height: 30),
              SizedBox(
                width: 10,
              ),
              Text(
                'Zinc',
                style:
                    GoogleFonts.poppins(fontSize: 30, color: Color(0xFF1A8CD8)),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            if (index != 5)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  index < 9
                      ? "What's your ${title[index]}"
                      : 'Upload your ${title[index]}',
                  style:
                      GoogleFonts.abel(color: Color(0xFF1A8CD8), fontSize: 35),
                ),
              ),
            if (index < 3)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: GoogleFonts.manrope(color: Colors.black, fontSize: 18),
                  keyboardType:
                      index == 0 ? TextInputType.name : TextInputType.number,
                  controller: controller[index],
                  decoration: InputDecoration(
                      hintText: hintText[index],
                      hintStyle: GoogleFonts.manrope()),
                ),
              ),
            if (index >= 3 && index < 5)
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      index == 3
                          ? HeightPicker()
                          : Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.9,
                              margin: const EdgeInsets.only(top: 100),
                              child: AnimatedWeightPicker(
                                dialColor: Color(0xFF1A8CD8),
                                suffixTextColor: Color(0xFF1A8CD8),
                                selectedValueColor: Color(0xFF1A8CD8),
                                min: 30,
                                max: 140,
                                onChange: (newValue) {},
                              ),
                            ),
                    ]),
              ),
            if (index == 5)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      'Select your Preferred Languages',
                      style: GoogleFonts.abel(
                          color: const Color(0xFF1A8CD8), fontSize: 25),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      selectLanguage(context, languages);
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: AutoSizeText(
                                selectedLanguages.isEmpty
                                    ? hintText[index]!
                                    : selectedLanguages.join(', '),
                                style: GoogleFonts.manrope(
                                    color: selectedLanguages.isEmpty
                                        ? Colors.grey
                                        : Colors.black,
                                    fontSize: 18),
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 30,
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            if (index >= 6 && index < 9)
              InkWell(
                onTap: (){
                  index == 6
                      ? selectGender(context)
                      : index == 7
                      ? selectSkin(context)
                      :index ==8
                      ? selectHair(context)
                      : null;
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black)),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          index == 6 && selectedGender != -1
                              ?gender[selectedGender]
                              : index == 7 && selectedSkin != -1
                              ? skin[selectedSkin]['title']
                              :  index == 8 && selectedHair != -1
                              ? hair[selectedHair]['title']
                              :hintText[index]!,
                          style: GoogleFonts.manrope(
                              color: Colors.grey, fontSize: 18),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                          size: 30,
                        )
                      ]),
                ),
              ),
            if (index >= 9)
              Center(
                child:
                InkWell(
                  onTap: ()async {
                    await _checkPermissionAndPickImage(index ==9 ? 0 : index==10 ?1 :2);
                  },
                  child: Stack(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 5,
                            shadowColor: Colors.blue,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child:
                              index == 9 && closeUp !=null
                              ? AspectRatio(
                                aspectRatio: 3/1.5,
                                child: Image.file(
                                  File(closeUp.path),
                                 // Adjust the height as needed
                                  fit: BoxFit.cover, // Adjust the fit as needed
                                ),
                              )
                              :index == 10 && midShot !=null
                              ? AspectRatio(
                                aspectRatio: 1.6/2,
                                child: Image.file(
                                  File(midShot.path), // Adjust the height as needed
                                  fit: BoxFit.cover, // Adjust the fit as needed
                                ),
                              )
                              :index == 11 && fullShot !=null
                              ?AspectRatio(
                                aspectRatio: 1.4/2,
                                child: Image.file(
                                  File(fullShot.path), // Adjust the height as needed
                                  fit: BoxFit.cover, // Adjust the fit as needed
                                ),
                              )
                              :Image(
                                  image: AssetImage(index == 9
                                      ? 'assets/icons/closeUp.png'
                                      : index == 10
                                          ? 'assets/icons/midShot.png'
                                          : 'assets/icons/fullShot.png')),
                            ),
                          )),
                      Positioned.fill(
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Upload',
                                  style: GoogleFonts.abel(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600)),
                              Icon(
                                Icons.file_upload_outlined,
                                color: Colors.white,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          if (index == 11) {
            user.phoneNumber = '9919293949';
            user.fullName = 'Akshay Vachhani';
            user.gender = 'Male';
            user.height = '5ft 8in';
            user.weight = 77;
            user.dob = DateTime.now();
            user.languages =selectedLanguages;
            user.hairType = 'Wavvy';
            user.skin ='Fair';
            user.images =
              {'closeUp' : closeUpBase,
                'midShot' : midShotBase,
                'longShot' : fullShotBase
              };
            user.nationality = 'Indian';
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PersonalizeProfile(user: user,)));


            return;
          }
          setState(() {
            index++;
          });
        },
        backgroundColor: const Color(0xFF1A8CD8),
        shape: CircleBorder(),
        child: const Icon(
          Icons.arrow_forward_sharp,
          color: Colors.white,
        ),
      ),
    );
  }

  void selectLanguage(BuildContext context, List<String> languages) {
    showModalBottomSheet(
      barrierColor: Colors.black54,
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: DropDownSearch(
              data: languages,
              selectedLanguages: selectedLanguages,
            ));
      },
    ).then((value) => setState(() {}));
  }

  void selectGender(BuildContext context) {
    int _selectedGender = selectedGender;
    showModalBottomSheet(
      barrierColor: Colors.black54,
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.35,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.white54,
                      title: Text(
                        'Select Gender',
                        style: GoogleFonts.abel(),
                      ),
                      actions: [
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.expand_circle_down,
                              size: 30,
                            ))
                      ],
                    ),
                    body: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: gender.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              ListTile(
                                trailing: _selectedGender == index
                                    ? const Icon(
                                  Icons.check_circle,
                                  color: Color(0xFF1A8CD8),
                                )
                                    : SizedBox.shrink(),
                                title: Text(gender[index],
                                    style: GoogleFonts.manrope(fontSize: 15)),
                                onTap: () async {
                                  _selectedGender = index;
                                  print(_selectedGender);
                                  setState(() {
                                  });
                                  onGenderSelected(_selectedGender);
                                  Future.delayed(Duration(milliseconds: 500)).then((
                                      value) =>
                                      Navigator.pop(context, selectedGender));
                                },
                              ),
                              Divider(thickness: 0.5, height: 1,)
                            ],
                          );
                        }),
                  ),
                ),
              );

            }
        );
      },
    );
  }

  void selectSkin(BuildContext context) {
    int _selectedSkin = selectedSkin;
    showModalBottomSheet(
      barrierColor: Colors.black54,
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.4,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.white54,
                      title: Text(
                        'Select Skin Type',
                        style: GoogleFonts.abel(),
                      ),
                      actions: [
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.expand_circle_down,
                              size: 30,
                            ))
                      ],
                    ),
                    body: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: skin.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: skin[index]['color'],
                                ),
                                trailing: _selectedSkin == index
                                    ? const Icon(
                                  Icons.check_circle,
                                  color: Color(0xFF1A8CD8),
                                )
                                    : SizedBox.shrink(),
                                title: Text(skin[index]['title'],
                                    style: GoogleFonts.manrope(fontSize: 15)),
                                onTap: () async {
                                  _selectedSkin = index;
                                  setState(() {
                                  });
                                  onSelectedSkin(_selectedSkin);
                                  Future.delayed(Duration(milliseconds: 500)).then((
                                      value) =>
                                      Navigator.pop(context));
                                },
                              ),
                              Divider(thickness: 0.5, height: 1,)
                            ],
                          );
                        }),
                  ),
                ),
              );

            }
        );
      },
    );
  }

  void selectHair(BuildContext context) {
    int _selectedHair = selectedHair;
    showModalBottomSheet(
      barrierColor: Colors.black54,
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.35,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.white54,
                      title: Text(
                        'Select Hair Type',
                        style: GoogleFonts.abel(),
                      ),
                      actions: [
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.expand_circle_down,
                              size: 30,
                            ))
                      ],
                    ),
                    body: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: hair.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: Image(
                                  image: AssetImage(hair[index]['image']),
                                  height: 30,
                                  width: 30,
                                ),
                                trailing: _selectedHair == index
                                    ? const Icon(
                                  Icons.check_circle,
                                  color: Color(0xFF1A8CD8),
                                )
                                    : SizedBox.shrink(),
                                title: Text(hair[index]['title'],
                                    style: GoogleFonts.manrope(fontSize: 15)),
                                onTap: () async {
                                  _selectedHair = index;
                                  setState(() {
                                  });
                                  onSelectedHair(_selectedHair);
                                  Future.delayed(Duration(milliseconds: 500)).then((
                                      value) =>
                                      Navigator.pop(context, selectedGender));
                                },
                              ),
                              Divider(thickness: 0.5, height: 1,)
                            ],
                          );
                        }),
                  ),
                ),
              );

            }
        );
      },
    );
  }

}
