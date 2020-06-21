import 'package:flutter/material.dart';
import 'package:bloodbank/utilities/constants.dart';

class RoundedSearchBar extends StatelessWidget {
  final Function searchFun;
  final Function dropdownFun;
  final String dropdownValue;
  final List list;

  RoundedSearchBar(
      {this.searchFun, this.dropdownFun, this.dropdownValue, this.list});

  Widget build(BuildContext context) {
    return Container(
        height: 42.0,
        child: Center(
          child: TextField(
            onChanged: searchFun,
            style: TextStyle(fontSize: 16),
            decoration: kTextFieldDecorationGrey.copyWith(
              hintText: 'Search',
              hintStyle: TextStyle(
                fontSize: 16,
                color: Color(0xFF9a0b0b),
              ),
              fillColor: Color(0xFFE9E9E9),
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xFF9a0b0b),
              ),
              suffixIcon: Container(
                width: 150,
                decoration: BoxDecoration(
                    color: Color(0xFF9a0b0b),
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                child: Center(
                  child: DropdownButton(
                    dropdownColor: Color(0xFF9a0b0b),
                    underline: SizedBox(),
                    elevation: 5,
                    items: list
                        .map((value) => DropdownMenuItem(
                              child: Text(
                                value,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              value: value,
                            ))
                        .toList(),
                    onChanged: dropdownFun,
                    value: dropdownValue,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
