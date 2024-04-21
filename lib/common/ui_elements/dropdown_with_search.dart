import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownSearch extends StatefulWidget {
  List<String> data;
  List<String> selectedLanguages;

  DropDownSearch({required this.data,required this.selectedLanguages});

  @override
  State<DropDownSearch> createState() => _DropDownSearchState();
}

class _DropDownSearchState extends State<DropDownSearch> {
  List<String> filteredLanguages = [];
  List<String> selectedLanguages = [];
  TextEditingController searchController = TextEditingController();
  List<String> languages = [];

  @override
  void initState() {
    super.initState();
    languages = widget.data;
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

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Icon(Icons.search_rounded),
            title: Container(
              child: TextField(
                style: GoogleFonts.manrope(),
                controller: searchController,
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: GoogleFonts.manrope(),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none),
                onChanged: filterLanguages,
              ),
            ),
            actions: [
              searchController.text.isEmpty
                  ? IconButton(
                      onPressed: () => Navigator.pop(context, widget.selectedLanguages),
                      icon: Icon(
                        Icons.expand_circle_down,
                        size: 30,
                      ))
                  : IconButton(
                      onPressed: () {
                        searchController.clear();
                        filterLanguages('');
                      },
                      icon: Icon(
                        Icons.cancel,
                        size: 30,
                      ))
            ],
          ),
          body: filteredLanguages.isEmpty
              ? const Center(
                  child: Text(
                    'No languages found',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: filteredLanguages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          trailing: widget.selectedLanguages
                                  .contains(filteredLanguages[index])
                              ? Icon(
                                  Icons.check_circle,
                                  color: Color(0xFF1A8CD8),
                                )
                              : SizedBox.shrink(),
                          title: Text(filteredLanguages[index],
                              style: GoogleFonts.manrope(fontSize: 15)),
                          onTap: () {
                            if (widget.selectedLanguages
                                .contains(filteredLanguages[index])) {
                              widget.selectedLanguages
                                  .remove(filteredLanguages[index]);
                            } else {
                              widget.selectedLanguages.add(filteredLanguages[index]);
                            }
                            setState(() {});
                          },
                        ),
                        Divider(
                          thickness: 0.5,
                          height: 1,
                        )
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
