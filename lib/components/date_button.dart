import 'package:bloodbank/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class RoundedDateButton extends StatelessWidget {
  RoundedDateButton({this.title, this.onChanged});

  final String title;
  final Function onChanged;

  final dateFormat = DateFormat("dd/MM/yyyy");

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
        onChanged: onChanged,
        decoration: kTextFieldDecorationWhite.copyWith(
            hintText: title,
            prefixIcon: Icon(
              Icons.calendar_today,
              color: Color(0xFF9a0b0b),
            )),
        format: dateFormat,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1990),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime.now());
        });
  }
}
