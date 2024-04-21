import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeightPicker extends StatefulWidget {
  @override
  _HeightPickerState createState() => _HeightPickerState();
}

class _HeightPickerState extends State<HeightPicker> {
  int selectedFeet = 5;
  int selectedInches = 8;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 200,
              child: CupertinoPicker(
                magnification: 1.1,
                itemExtent: 32.0,
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedFeet = index;
                  });
                },
                children: List.generate(
                  10,
                      (index) => Text('$index ft'),
                ),
                scrollController: FixedExtentScrollController(initialItem: selectedFeet),
              ),
            ),

            // Inches Picker
            SizedBox(
              width: 150,
              height: 200,
              child: CupertinoPicker(
                magnification: 1.1,
                itemExtent: 32.0,
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedInches = index;
                  });
                },
                children: List.generate(
                  12,
                      (index) => Text('$index in'),
                ),
                scrollController: FixedExtentScrollController(initialItem: selectedInches),
              ),
            ),
          ],
        ),
      ),
    );
  }
}