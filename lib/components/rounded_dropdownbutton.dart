import 'package:flutter/material.dart';

class RoundedBorderDropdown extends StatelessWidget {
  final String hint;
  final Color colour;
  final IconData icon;
  final Color hintColor;
  final Color borderColor;
  final List list;
  final Function onChange;
  final String value;
  final Color textColor;

  RoundedBorderDropdown(
      {this.hint,
      this.colour,
      this.icon,
      this.hintColor,
      this.borderColor,
      this.list,
      this.value,
      this.onChange,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500,
        height: 50.0,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
              color: borderColor, style: BorderStyle.solid, width: 0.80),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Icon(
                icon,
                color: Color(0xFF9a0b0b),
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: DropdownButton(
                  underline: SizedBox(),
                  isExpanded: true,
                  elevation: 5,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                    color: Color(0xFF9a0b0b),
                  ),
                  hint: Text(hint,
                      style: TextStyle(color: hintColor, fontSize: 15)),
                  items: list
                      .map((value) => DropdownMenuItem(
                            child: Text(
                              value,
                              style: TextStyle(color: textColor),
                            ),
                            value: value,
                          ))
                      .toList(),
                  onChanged: onChange,
                  value: value,
//          value: dropdownValues.first,
                ),
              ),
            ),
          ],
        ));
  }
}
