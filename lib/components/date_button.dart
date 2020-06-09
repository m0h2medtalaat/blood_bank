import 'package:bloodbank/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class RoundedDateButton extends StatefulWidget {
  RoundedDateButton({
    this.title,
  });

  final String title;

  @override
  _RoundedDateButtonState createState() => _RoundedDateButtonState();
}

class _RoundedDateButtonState extends State<RoundedDateButton> {
  final dateFormat = DateFormat("dd/MM/yyyy");
  DateTime date;

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
        decoration: kTextFieldDecorationWhite.copyWith(
            hintText: widget.title,
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
