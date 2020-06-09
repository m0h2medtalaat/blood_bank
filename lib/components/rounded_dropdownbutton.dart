import 'package:flutter/material.dart';

List<String> list = ['first', 'second'];

class RoundedBorderDropdown extends StatefulWidget {
  final String hint;
  final Color colour;
  final IconData icon;
  final Color hintColor;
  final Color borderColor;

  RoundedBorderDropdown(
      {this.hint, this.colour, this.icon, this.hintColor, this.borderColor});

  @override
  _RoundedBorderDropdownState createState() => _RoundedBorderDropdownState();
}

class _RoundedBorderDropdownState extends State<RoundedBorderDropdown> {
  final List<String> dropdownValues = list;
  String val;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500,
        height: 50.0,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          color: widget.colour,
          borderRadius: BorderRadius.circular(30.0),
//          border: Border.all(
//              color: widget.borderColor, style: BorderStyle.solid, width: 0.80),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Icon(
                widget.icon,
                color: Color(0xFF9a0b0b),
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: DropdownButton(
                  isExpanded: true,
                  elevation: 5,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                    color: Color(0xFF9a0b0b),
                  ),
                  hint: Text(widget.hint,
                      style: TextStyle(color: widget.hintColor, fontSize: 15)),
                  items: dropdownValues
                      .map((value) => DropdownMenuItem(
                            child: Text(
                              value,
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
          ],
        ));
  }
}
