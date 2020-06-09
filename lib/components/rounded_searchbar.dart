import 'package:flutter/material.dart';

List<String> list = ['first', 'second'];

class RoundedSearchBar extends StatefulWidget {
  @override
  _RoundedSearchBarState createState() => _RoundedSearchBarState();
}

class _RoundedSearchBarState extends State<RoundedSearchBar> {
  final List<String> dropdownValues = list;
  String val;
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minWidth: double.infinity),
        height: 50.0,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          color: Color(0xFFEBEBEB),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: DropdownButton(
                  elevation: 5,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 20,
                    color: Color(0xFF9a0b0b),
                  ),
                  hint: Text(
                    dropdownValues[0],
                    style: TextStyle(
                        color: Color(0xFF9a0b0b),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  items: dropdownValues
                      .map((value) => DropdownMenuItem(
                            child: Text(
                              value,
                              style: TextStyle(
                                  color: Color(0xFF9a0b0b),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            value: value,
                          ))
                      .toList(),
                  onChanged: (String value) {
                    setState(() {
                      val = value;
                    });
                  },
                  value: val,
//          value: dropdownValues.first,
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: TextField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search, color: Color(0xFF9a0b0b)),
                  hintText: 'Enter a value',
                  hintStyle: TextStyle(color: Color(0xFFD0A0A0), fontSize: 18),
                  fillColor: Color(0xFFEBEBEB),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ));
  }
}
