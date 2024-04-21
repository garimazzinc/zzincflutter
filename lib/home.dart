import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zinc/common/ui_elements/audition_widget.dart';
import 'package:zinc/zinc_profile/performance_widget.dart';
import 'package:zinc/zinc_profile/profile_widget.dart';
import 'common/ui_elements/swipeUp.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPageIndex = 0;
  late PageController _pageController;

  final List<String> items = List.generate(20, (index) => 'Item $index');

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentPageIndex != 0
          ? AppBar(
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    _pageController.animateToPage(
                      0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                    );
                  });
                },
                icon: Icon(Icons.arrow_back, color: Color(0xFF1A8CD8)),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              title: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Image(
                        image: AssetImage('assets/images/zinclogo.png'),
                        height: 30),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Zinc',
                      style: GoogleFonts.poppins(
                          fontSize: 30, color: Color(0xFF1A8CD8)),
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search, color: Color(0xFF1A8CD8)))
              ],
            )
          : null,
      body: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: (items.length / 2).ceil(),
          itemBuilder: (context, index) {
            if (index == 0) {
              return landingPage();
            } else {
              return _buildPage(index - 1);
            }
          },
          onPageChanged: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          }),
    );
  }

  Widget landingPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hi Jasmine!',
                style:
                    GoogleFonts.lobster(color: Color(0xFF1A8CD8), fontSize: 30),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        color: Color(0xFF1A8CD8),
                        size: 40,
                      )),
                  SizedBox(width: 10,),
                  CircleAvatar(
                    radius: 20, // Adjust as needed
                    backgroundImage: AssetImage('assets/icons/closeUp.png'),
                    backgroundColor: Colors.grey, // Placeholder color
                  )
                ],
              )
            ],
          ),
        ),
        ProfileWidget(),
        PerformanceWidget(),
        Center(child: SwipeUpAnimation()),
      ],
    );
  }

  Widget _buildPage(int pageIndex) {
    if (pageIndex < 0 || pageIndex >= (items.length / 2).ceil()) {
      return Container(); // Return an empty container if pageIndex is out of range
    }

    final startIndex = pageIndex * 2;
    final endIndex = startIndex + 2;

    return Column(
      children: items
          .sublist(
              startIndex, endIndex > items.length ? items.length : endIndex)
          .map((item) => AuditionWidget(
                item: item,
              ))
          .toList(),
    );
  }
}
